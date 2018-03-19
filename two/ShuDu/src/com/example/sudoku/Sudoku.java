package com.example.sudoku;

import android.media.audiofx.BassBoost.Settings;
import android.os.Bundle;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.util.Log;

public class Sudoku extends Activity implements OnClickListener {

	private static final String TAG = "ShuDu";
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_sudoku);
		View aboutButton = this.findViewById(R.id.about_button);
		aboutButton.setOnClickListener(this);
		
		View newgameButton = this.findViewById(R.id.newgame_button);
		newgameButton.setOnClickListener(this);
		
		View continueButton = this.findViewById(R.id.continue_button);
		continueButton.setOnClickListener(this);
		
		View exitButton = this.findViewById(R.id.exit_button);
		exitButton.setOnClickListener(this);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		super.onCreateOptionsMenu(menu);
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.sudoku, menu);
		return true;
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		switch(v.getId()){
		case R.id.continue_button:
			startGame(Game.DIFFICULTY_CONTINUE);
			break;
		case R.id.about_button:
			Intent i = new Intent(this,About.class);
			startActivity(i);
			break;
		case R.id.newgame_button:
			openNewGameDialog();
			break;
		case R.id.exit_button:
			finish();
			break;
		
		}
	}
	
	private void openNewGameDialog(){
		new AlertDialog.Builder(this).
		setTitle(R.string.newgame_title).
		setItems(R.array.difficulty,new DialogInterface.OnClickListener(){
			@Override
			public void onClick(DialogInterface dialoginerface, int i) {
				// TODO Auto-generated method stub
				startGame(i);
			}
		}).show();
		}
	
	private void startGame(int i){
		Log.d(TAG, "clicked on" + i);
		Intent intent = new Intent(Sudoku.this,Game.class);
		intent.putExtra(Game.KEY_DIFFICULTY, i);
		startActivity(intent);
	}

	@SuppressLint("NewApi")
	public boolean onOptionsItemSelected(MenuItem item){
		switch(item.getItemId()){
		case R.id.settings:
			startActivity(new Intent(this,NewSettings.class));
			return true;
		}
		return false;
	}
	
	protected void onResume(){
		super.onResume();
		Music.play(this,R.raw.main);
	}
	
	protected void onPause(){
		super.onPause();
		Music.stop(this);
	}
}
