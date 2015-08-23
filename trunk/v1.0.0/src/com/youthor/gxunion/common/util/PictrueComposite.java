package com.youthor.gxunion.common.util;

import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 
 * @author jason
 * 
 */
public class PictrueComposite {
    // 需要组合到背景图片的小图片XY轴坐标，是根据大图片的千分比的大小，为1000的倍数
    private int[] newImgX;
    private int[] newImgY;
    // 背景图片名和路径
    private String bgImgNameAndPath;
    // 小图片名和路径
    private String newImgNameAndPath;
    // 目标输出文件路径以及名称
    private String targetImgNameAndPath;
        
    public PictrueComposite(String bgImgNameAndPath, String newImgNameAndPath,
            String targeFileNameAndPath) {
        this.bgImgNameAndPath = bgImgNameAndPath;
        this.newImgNameAndPath = newImgNameAndPath;
        this.targetImgNameAndPath = targeFileNameAndPath;
    }

    public void createJpgByFont(Font font) throws Exception {
        try {
            File bgFile = new File(bgImgNameAndPath);
            BufferedImage biImage = ImageIO.read(bgFile);
            
            // 填充文字
            /*
             * Graphics2D g = bimage.createGraphics();
             * //g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
             * RenderingHints.VALUE_ANTIALIAS_ON); //Font font =
             * Font.decode("宋体"); //g.setColor(Color.decode("#FF0000"));
             * //g.setFont(font.deriveFont(Float.parseFloat("12")));
             * //g.drawString(s,this.getName_x(),this.getName_y()); //释放资源
             * //g.dispose();
             */

            File newImgFile = new File(newImgNameAndPath);
            BufferedImage biNewImgFile = ImageIO.read(newImgFile);
            int width = biNewImgFile.getWidth();
            int height = biNewImgFile.getHeight();
            int[] ImageArrayNewImg = new int[width * height];

            ImageArrayNewImg = biNewImgFile.getRGB(0, 0, width, height,
                    ImageArrayNewImg, 0, width);

            if (newImgX != null && newImgY != null && newImgX.length == newImgY.length) {
                for (int i = 0; i < newImgX.length; i++) {
                    int imgX = biImage.getWidth() * newImgX[i]/1000;
                    int imgY = biImage.getHeight() * newImgY[i]/1000;
                    
                    System.out.println("newImgX--->"  + newImgX[i]);
                    System.out.println("newImgY--->"  + newImgY[i]);
                    System.out.println("xxx--->"  + imgX);
                    System.out.println("yyy--->"  + imgY);
                    System.out.println("biImage.getWidth()--->"  + biImage.getWidth());
                    System.out.println("biImage.getHeight()--->"  + biImage.getHeight());
                    System.out.println("width--->"  + width);
                    System.out.println("height--->"  + height);
                    
                    if(imgX >= width/2 && imgY >= height/2 && 
                            (imgX + width/2)<= biImage.getWidth() && (imgY + height/2)<=biImage.getHeight()){
                    
                        biImage.setRGB((imgX-width/2), (imgY - height/2), width, height,ImageArrayNewImg, 0, width);
                    }
                }
            }
            // 指定输出文件
            FileOutputStream out = new FileOutputStream(targetImgNameAndPath);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(biImage);
            param.setQuality(100f, true);
            encoder.encode(biImage, param);
            // 存盘
            out.flush();
            out.close();
        } catch (Exception e) {
            System.out.println("createJpgByFont Failed!");
            e.printStackTrace();
        }
    }
    
    public int getImgWidth(){
        try {
            File newImgFile = new File(bgImgNameAndPath);
            BufferedImage biNewImgFile = ImageIO.read(newImgFile);
            return biNewImgFile.getWidth();
        } 
        catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }
    public int getImgHeight(){
        try {
            File newImgFile = new File(bgImgNameAndPath);
            BufferedImage biNewImgFile = ImageIO.read(newImgFile);
            return biNewImgFile.getHeight();
        } 
        catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int getLogoWidth(){
        try {
            File newImgFile = new File(newImgNameAndPath);
            BufferedImage biNewImgFile = ImageIO.read(newImgFile);
            return biNewImgFile.getWidth();
        } 
        catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }
    public int getLogoHeight(){
        try {
            File newImgFile = new File(newImgNameAndPath);
            BufferedImage biNewImgFile = ImageIO.read(newImgFile);
            return biNewImgFile.getHeight();
        } 
        catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int[] getNewImgX() {
        return newImgX;
    }

    public void setNewImgX(int[] newImgX) {
        this.newImgX = newImgX;
    }

    public int[] getNewImgY() {
        return newImgY;
    }

    public void setNewImgY(int[] newImgY) {
        this.newImgY = newImgY;
    }

    public String getBgImgNameAndPath() {
        return bgImgNameAndPath;
    }

    public void setBgImgNameAndPath(String bgImgNameAndPath) {
        this.bgImgNameAndPath = bgImgNameAndPath;
    }

    public String getNewImgNameAndPath() {
        return newImgNameAndPath;
    }

    public void setNewImgNameAndPath(String newImgNameAndPath) {
        this.newImgNameAndPath = newImgNameAndPath;
    }

    public String getTargetImgNameAndPath() {
        return targetImgNameAndPath;
    }

    public void setTargetImgNameAndPath(String targetImgNameAndPath) {
        this.targetImgNameAndPath = targetImgNameAndPath;
    }

    public static void main(String[] args) throws Exception {
        PictrueComposite c = new PictrueComposite("E:/img/bg.jpg","E:/img/newImg.jpg", "E:/img/composite.jpg");
        
        int [] imgX = {10,200,320};
        int [] imgY = {10,200,320};
        
        c.setNewImgX(imgX);
        c.setNewImgY(imgY);
        
        c.createJpgByFont(null);
    }
}
