package com.tekdhaba.biocheck;

import android.content.Context;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.util.Log;

import com.google.android.gms.maps.model.LatLng;

import java.util.List;

public class GpsHandler implements LocationListener
{
	private Context context;
    private static final String LOG_TAG = "GpsHandler";
    private static final int	DATA_TIME_OUT 		= 30 * 1000;

	// Acquire a reference to the system Location Manager
    private LocationManager locationManager;

	private static final int gpsMinTime = 500;

	private final Criteria criteria = new Criteria();

	private double dSpeedKmh = 0;
	private double dAmplitude = 0;
	private double dSpeedAverage = 0;
	private double dDistance = 0;

	private TimerDataTimeOut	tTimerDataTimeOut;

	private Location lPrefLocation = null; // Pref known location
    private boolean bTrainingOn = false;
	private boolean bTrainingPause = false;

	public GpsHandler(Context mContext)
	{
		bTrainingOn = false;
		lPrefLocation = null;
		dDistance = 0;

		try {
			context = mContext;
			if (locationManager == null) {
				locationManager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
			}
			criteria.setAccuracy(Criteria.ACCURACY_FINE);
			criteria.setSpeedRequired(true);
			criteria.setAltitudeRequired(false);
			criteria.setBearingRequired(false);
			criteria.setCostAllowed(true);
			criteria.setPowerRequirement(Criteria.POWER_LOW);
			final String bestProvider = locationManager.getBestProvider(criteria, true);
			if (bestProvider != null && bestProvider.length() > 0) {

				lPrefLocation = locationManager.getLastKnownLocation(bestProvider);
			} else {
				final List<String> providers = locationManager.getProviders(true);
				for (final String provider : providers) {
					//if (AppHelper.CheckPermissionLocation(context))
						lPrefLocation = locationManager.getLastKnownLocation(provider);
				}
			}
			tTimerDataTimeOut = new TimerDataTimeOut(DATA_TIME_OUT, DATA_TIME_OUT);
		}catch (SecurityException e) { e.printStackTrace();
        }
	}


	@Override
	public void onLocationChanged(Location location)
	{
//		Log.d(LOG_TAG, "On Location changed sp" + dSpeedKmh + " dist" +  dDistance + " new " + location.getSpeed()*3.6);
		dSpeedKmh = (location.getSpeed()*3.6);
		dAmplitude = location.getAltitude();

        if(dSpeedAverage == 0)
        {
			dSpeedAverage = dSpeedKmh;
        }
        else{
			dSpeedAverage =  (((dSpeedAverage *2)+ dSpeedKmh)/3);
        }

		if(bTrainingOn)
		{
			if(lPrefLocation == null)
			{
				lPrefLocation = location;
			}
			if(dSpeedKmh >= 1) // only if there is a speed.
			{
				if(!bTrainingPause)
					dDistance += (location.distanceTo(lPrefLocation));
				lPrefLocation = location;
			}
		}
		Log.d(LOG_TAG, "rest Gps data --- Speed "+dSpeedAverage);
		Log.d(LOG_TAG, "rest Gps data --- Amplitude "+dAmplitude);
		Log.d(LOG_TAG, "rest Gps data --- Distance "+dDistance);
		Log.d(LOG_TAG, "rest Gps data"+location.getLatitude());
		Log.d(LOG_TAG, "rest Gps data"+location.getLongitude());
		Log.d(LOG_TAG, "rest Gps data--- Distance "+dDistance);
		tTimerDataTimeOut.cancel();
		tTimerDataTimeOut.start();
	}

	@Override
	public void onStatusChanged(String provider, int status, Bundle extras) {}
	@Override
	public void onProviderEnabled(String provider) {}
	@Override
	public void onProviderDisabled(String provider) {}


	public void StartGps()
	{
		bTrainingOn = true;
		lPrefLocation = null;
		dDistance = 0;

		try{
			if (locationManager == null)
			{
				locationManager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
			}
			criteria.setAccuracy(Criteria.ACCURACY_FINE);
			criteria.setSpeedRequired(true);
			criteria.setAltitudeRequired(false);
			criteria.setBearingRequired(false);
			criteria.setCostAllowed(true);
			criteria.setPowerRequirement(Criteria.POWER_LOW);
			final String bestProvider = locationManager.getBestProvider(criteria, true);
			if (bestProvider != null && bestProvider.length() > 0)
			{
				//if(AppHelper.CheckPermissionLocation(context))
					locationManager.requestLocationUpdates(bestProvider, gpsMinTime, 0, this);//gpsMinDistance
			}
			else
			{
				final List<String> providers = locationManager.getProviders(true);
				for (final String provider : providers)
				{
					//if(AppHelper.CheckPermissionLocation(context)) {
						locationManager.requestLocationUpdates(provider, gpsMinTime, 0, this);//gpsMinDistance
					//}
				}
			}
		} catch (SecurityException e) {
            e.printStackTrace();
        }
	}
	public void StopGps()
	{
		bTrainingOn = false;
		try
		{
			if (locationManager != null)
			{
				locationManager.removeUpdates(this);
			}
			locationManager = null;
		}
		catch (SecurityException e) { e.printStackTrace();
        }

	}

	public LatLng GetCurrentPosition()
	{
		LatLng newLatLong = new LatLng(0, 0);
		if(lPrefLocation != null)
			newLatLong = new LatLng(lPrefLocation.getLatitude(), lPrefLocation.getLongitude());
		return newLatLong;
	}

	public double GetCurrentSpeedKmh()
	{
		return dSpeedAverage;
	}

	public double GetDistance()
	{
		return dDistance;
	}

	public double GetHeight()
	{
		return dAmplitude;
	}

	public void SetGpsTrainingPause(boolean bOn)
	{
		bTrainingPause = bOn;
	}

	public  void SetGpsTrainingOn(boolean bOn)
	{
		bTrainingOn = bOn;
		if(bTrainingOn)
		{
			bTrainingPause = false;
			dDistance = 0;
			dSpeedAverage = 0;
		}
	}

	// ---------------------------------------------------------------------------
	// Function : PoolingTimer
	// Input :
	// Description : PoolingTimer the send the message to the fragments
	// ---------------------------------------------------------------------------
	public class TimerDataTimeOut extends CountDownTimer {
		public TimerDataTimeOut(long millisInFuture, long countDownInterval) {
			super(millisInFuture, countDownInterval);
		}

		@Override
		public void onFinish() //
		{
			Log.d(LOG_TAG, "rest Gps data");
			dSpeedKmh = 0;
		}

		@Override
		public void onTick(long millisUntilFinished) {
		}
	}
}
