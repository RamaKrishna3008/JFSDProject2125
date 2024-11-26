package com.klef.jfsd.sdp.service;

public interface CaptchaService {

	public String generateText(int captchaLength);

	public byte[] generateCaptcha(int captchaLength);

	public boolean validateCaptcha(String input);

}
