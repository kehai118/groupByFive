package com.second.service;

import com.sun.istack.internal.NotNull;
import java.util.List;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;
import java.awt.image.BufferedImage;
import java.io.*;


@Service
public class FileService {

    public boolean GenerateImage(@NotNull String imgStr,@NotNull String imgPath,@NotNull String imgName) {
        File headPath = new File(imgPath);//获取文件夹路径
        if (!headPath.exists()) {//判断文件夹是否创建，没有创建则创建新文件夹
            headPath.mkdirs();
        }
                //定义图片路径
        String imgFilePath = imgPath + "/" + imgName + ".jpg";
                //新生成的图片
          try(OutputStream out = new FileOutputStream(imgFilePath)){
              byte [] imageData = DatatypeConverter.parseBase64Binary(imgStr.substring(imgStr.indexOf(",")+ 1));
              BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(imageData));
              ImageIO.write(bufferedImage,"png",out);
              out.flush();
            return true;
          } catch (FileNotFoundException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }
          return false;
    }


}
