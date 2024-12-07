package com.klef.jfsd.sdp.service;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Service;

@Service
public class CaptchaServiceImpl implements CaptchaService
{
	private String currentCaptchaText;
	
	@Override
	public String generateText(int captchaLength)
	{
	   String captcha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	   StringBuffer captchaBuffer = new StringBuffer();
	   Random rnd = new Random();
	   
	   while(captchaBuffer.length() < captchaLength)
	   {
		   int index =(int) (rnd.nextFloat() * captcha.length()); 
		   captchaBuffer.append(captcha.charAt(index));
	   }
	   
	   currentCaptchaText=captchaBuffer.toString();
	   System.out.println(currentCaptchaText);
	   return currentCaptchaText;
   }
   
	@Override
	public byte[] generateCaptcha(int captchaLength) {
	    String captchaText = generateText(captchaLength); 
	    int width = 200; 
	    int height = 60;

	    BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

	    Graphics2D g2d = img.createGraphics();

	    g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
	    g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

	    GradientPaint gradient = new GradientPaint(0, 0, new Color(240, 240, 255),width, height, Color.WHITE, true);

	    g2d.setPaint(gradient);
	    g2d.fillRect(0, 0, width, height);

	    g2d.setColor(getRandomDarkColor());
	    g2d.setFont(new Font("Arial", Font.BOLD, 32)); 

	    int x = 20;
	    for (char c : captchaText.toCharArray()) {
	        int y = 40 + (int) (Math.random() * 10 - 5);
	        g2d.drawString(String.valueOf(c), x, y);
	        x += 30; 
	    }

	    g2d.dispose();

	    ByteArrayOutputStream bout = new ByteArrayOutputStream();
	    try {
	        ImageIO.write(img, "png", bout);
	    } catch (IOException e) {
	        throw new RuntimeException("Error generating captcha image", e);
	    }

	    return bout.toByteArray();
	}

	private Color getRandomDarkColor() {
	    int r = (int) (Math.random() * 100);
	    int g = (int) (Math.random() * 100); 
	    int b = (int) (Math.random() * 100); 
	    return new Color(r, g, b);
	}


	
	@Override
   public boolean validateCaptcha(String input) 
   {
       return input.equals(currentCaptchaText);  
   }
}
