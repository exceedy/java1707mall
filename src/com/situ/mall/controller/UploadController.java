package com.situ.mall.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="upload")
public class UploadController {
	
	@RequestMapping(value="uploadPic")
	@ResponseBody
	public Map<String,Object> uploadPic(MultipartFile pritrueFile) {
		Map<String,Object> map = new HashMap<String,Object>();
		String name = UUID.randomUUID().toString().replace("-", "");
		String ext = FilenameUtils.getExtension(pritrueFile.getOriginalFilename());
		String fileName = name + "." + ext;
		String filePath = "E:\\Pic\\" + fileName;
		try {
			pritrueFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("fileName", fileName);
		return map;
	}
}
