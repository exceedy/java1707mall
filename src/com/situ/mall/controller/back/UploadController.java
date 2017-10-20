package com.situ.mall.controller.back;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.situ.mall.constans.MallConstant;
import com.situ.mall.util.JsonUtils;
import com.situ.mall.util.QiniuUploadUtil;

@Controller
@RequestMapping(value="upload")
public class UploadController {
	
	/*@RequestMapping(value="uploadPic",produces=MediaType.TEXT_PLAIN_VALUE+";charset=utf-8")
	@ResponseBody
	public String uploadPic(MultipartFile pritrueFile) {
		String name = UUID.randomUUID().toString().replace("-", "");
		String ext = FilenameUtils.getExtension(pritrueFile.getOriginalFilename());
		String fileName = name + "." + ext;
		String filePath = MallConstant.SERVER_ADDRES + fileName;
		try {
			pritrueFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("error", 0);
		result.put("url", filePath);
		result.put("fileName", fileName);
		//将object转换成json
		return JsonUtils.objectToJson(result);
	}*/
	
	@RequestMapping(value="/uploadPic")
	@ResponseBody
	public String uploadPic(MultipartFile pictureFile) {
		return uploadByQiniu(pictureFile);
		
		//上传到七牛
		//return uploadByQiniu(pictureFile);
	}
	private String uploadByQiniu(MultipartFile pictureFile) {
		try {String fileName = null;
		try {
			fileName = QiniuUploadUtil.upload(pictureFile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("fileName", fileName);
		//return map;
		Map result = new HashMap<Object, Object>();
		result.put("error", 0);
		//result.put("url", filePath);
		result.put("url",  fileName);
		//将object转换成json
		return JsonUtils.objectToJson(result);
	} catch (Exception e) {
		e.printStackTrace();
		Map result = new HashMap<Object, Object>();
		result.put("error", 1);
		result.put("message", "图片上传失败");
		return JsonUtils.objectToJson(result);
	}
	}
}
