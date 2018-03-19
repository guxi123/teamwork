package com.example.sudoku;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Rect;
import android.graphics.Paint.Style;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.widget.Toast;

public class PuzzleView extends View {

	private static final String TAG = "Sudoku";
	private final Game game;
	
	private static final String SELX = "selX";
	private static final String SELY = "selY";
	private static final String VIEW_STATE = "viewState";
	private static final int ID = 42;
	
	private float height;
	private float width;
	private int selX;
	private int selY;
	private final Rect selRect = new Rect();
	
	public PuzzleView(Context context){
		super(context);
		this.game = (Game)context;
		setFocusable(true);
		setFocusableInTouchMode(true);
		setId(ID);
	}
	
    protected Parcelable onSaveInstanceState(){
    	Parcelable p = super.onSaveInstanceState();
    	Bundle bundle = new Bundle();
    	bundle.putInt(SELX, selY);
    	bundle.putInt(SELY, selY);
    	bundle.putParcelable(VIEW_STATE, p);
    	return bundle;
    }
	
    protected void onRestoreInstanceState(Parcelable state){
    	Bundle bundle = (Bundle)state;
    	select(bundle.getInt(SELX),bundle.getInt(SELY));
    	super.onRestoreInstanceState(bundle.getParcelable(VIEW_STATE));
    	return ;
    }

	protected void onSizeChanged(int w,int h,int oldw,int oldh){
		width = w / 9f;
		height = h / 9f;
		getRect(selX,selY,selRect);
		super.onSizeChanged(w, h, oldw, oldh);
	}
	
	protected void onDraw(Canvas canvas){
		Paint background = new Paint();
		background.setColor(getResources().getColor(R.color.puzzle_background));
		canvas.drawRect(0, 0 ,getWidth(),getHeight(),background);
		
		Paint dark = new Paint();
		dark.setColor(getResources().getColor(R.color.puzzle_dark));
		
		Paint hilite = new Paint();
		hilite.setColor(getResources().getColor(R.color.puzzle_hilite));
		
		Paint light = new Paint();
		light.setColor(getResources().getColor(R.color.puzzle_light));
		
		Paint foreground = new Paint(Paint.ANTI_ALIAS_FLAG);
		foreground.setColor(getResources().getColor(R.color.puzzle_foreground));
		foreground.setStyle(Style.FILL);
		foreground.setTextSize(height * 0.75f);
		foreground.setTextScaleX(width / height);
		foreground.setTextAlign(Paint.Align.CENTER);
		
		Paint hint = new Paint();
		int c[] = {getResources().getColor(R.color.puzzle_hints_0),getResources().getColor(R.color.puzzle_hints_1),getResources().getColor(R.color.puzzle_hints_2)};
		Rect r = new Rect();
		if(NewSettings.getHints(getContext()))
		{
			for(int i = 0;i < 9;i++)
			{
				for(int j = 0;j < 0;j++)
				{
					int movesleft = 9 - game.getUsedTiles(i,j).length;
					if(movesleft < c.length){
						getRect(i,j,r);
						hint.setColor(c[movesleft]);
						canvas.drawRect(r, hint);
					}
				}
			}
			
			Paint selected = new Paint();
			selected.setColor(getResources().getColor(R.color.puzzle_selected));
			canvas.drawRect(selRect, selected);
			
			FontMetrics fm = foreground.getFontMetrics();
			float x = width / 2;
			float y = height / 2 - (fm.ascent + fm.descent) / 2;
			for(int i = 0;i < 9;i++)
			{
				for(int j = 0;j < 9;j++)
				{
					canvas.drawText(this.game.getTileString(i,j), i * width + x, j * height + y, foreground);
				}
			}
			for(int i = 0;i < 9;i++)
			{
				canvas.drawLine(0, i * height, getWidth(), i * height, light);
				canvas.drawLine(0, i * height + 1, getWidth(), i * height + 1, hilite);
				canvas.drawLine(i * width, 0, i * width, getHeight(), light);
				canvas.drawLine(i * width + 1, 0, i * width + 1, getHeight(), hilite);
			}
			
			for(int i = 0;i < 9;i++){
				if(i % 3 != 0)
					continue;
				canvas.drawLine(0, i * height, getWidth(), i * height, dark);
				canvas.drawLine(0, i * height + 1, getWidth(), i * height + 1, hilite);
				canvas.drawLine(i * width, 0, i * width, getHeight(), dark);
				canvas.drawLine(i * width + 1, 0, i * width + 1, getHeight(), hilite);
			}
		}
		
	}
	
	private void getRect(int x,int y,Rect rect)
	{
		rect.set((int)(x * width),(int)(y * height),(int)(x * width + width),(int)(y * height + height));
	}
	
	public boolean onKeyDown(int keyCode,KeyEvent event){
		switch(keyCode){
		case KeyEvent.KEYCODE_DPAD_UP:
			select(selX,selY - 1);
			break;
		case KeyEvent.KEYCODE_DPAD_DOWN:
			select(selX,selY + 1);
			break;
		case KeyEvent.KEYCODE_DPAD_LEFT:
			select(selX - 1,selY);
			break;
		case KeyEvent.KEYCODE_DPAD_RIGHT:
			select(selX + 1,selY);
			break;
		case KeyEvent.KEYCODE_0:
		case KeyEvent.KEYCODE_SPACE:setSelectedTile(0);break;
		case KeyEvent.KEYCODE_1:setSelectedTile(1);break;
		case KeyEvent.KEYCODE_2:setSelectedTile(2);break;
		case KeyEvent.KEYCODE_3:setSelectedTile(3);break;
		case KeyEvent.KEYCODE_4:setSelectedTile(4);break;
		case KeyEvent.KEYCODE_5:setSelectedTile(5);break;
		case KeyEvent.KEYCODE_6:setSelectedTile(6);break;
		case KeyEvent.KEYCODE_7:setSelectedTile(7);break;
		case KeyEvent.KEYCODE_8:setSelectedTile(8);break;
		case KeyEvent.KEYCODE_9:setSelectedTile(9);break;
		case KeyEvent.KEYCODE_ENTER:
		case KeyEvent.KEYCODE_DPAD_CENTER:
			game.showKeypadOrError(selX,selY);
			break;
		default:
			return super.onKeyDown(keyCode, event);
		}
		return true;
	}
	
	public void setSelectedTile(int tile){
		if(game.setTileIfValid(selX,selY,tile)){
			invalidate();
		}
		else{
			startAnimation(AnimationUtils.loadAnimation(game, R.anim.shake));
		}
	}
	private void select(int x,int y){
		invalidate(selRect);
		selX = Math.min(Math.max(x, 0), 8);
		selY = Math.min(Math.max(y, 0), 8);
		getRect(selX,selY,selRect);
		invalidate(selRect);
	}
	
	public boolean onTouchEvent(MotionEvent event){
		if(event.getAction() != MotionEvent.ACTION_DOWN)
			return super.onTouchEvent(event);
		
		select((int)(event.getX() / width),(int)(event.getY() / height));
		game.showKeypadOrError(selX,selY);
		return true;
	}

}
