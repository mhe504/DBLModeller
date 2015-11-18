package uk.ac.york.mhe504.dblm.datacapture;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.zip.GZIPInputStream;

/**
 * This class is used by {@link uk.ac.york.mhe504.dblm.datacapture.WikipediaLogProcessor}
 * to download and uncompress the required files.
 * 
 * @author mhe504@york.ac.uk
 *
 */
class Downloader implements Runnable {

	private URL url;
	private String filename;
	public Downloader(URL u, String fname)
	{
		url = u;
		filename = fname;
	}
	
    public void run(){

    	File compressFile = new File(filename);
    	File uncompressFile = new File(filename.split("\\.")[0]);
    	if (!compressFile.exists() && !uncompressFile.exists())
    	{
        	download();
    	}
    	else
    	{
    		System.out.println("Download skipped: " + filename + " already exists in the current directory");
    	}
    	
		
    	if (!uncompressFile.exists())
    	{
    		if (filename.contains(".gz"))
    			gzExtract();
    		else if (filename.contains(".bz2"))
    			bzipExtract();    		
    	}
    	else
    	{
    		System.out.println("Decompression skipped: " + filename.split("\\.")[0] + " already exists in the current directory");
    	}

    }
    
    private void download()
    {
		InputStream is = null;
		FileOutputStream fos = null;
		try {
			long startTime = System.currentTimeMillis();
			System.out.println("download(" + url + "," + filename + ") : starting download");

	        URLConnection urlConn = url.openConnection();//connect

	        is = urlConn.getInputStream();               //get connection inputstream
	        fos = new FileOutputStream(filename);   //open outputstream to local file

	        byte[] buffer = new byte[4096];              //declare 4KB buffer
	        int len;

	        //while we have availble data, continue downloading and storing to local file
	        while ((len = is.read(buffer)) > 0) {  
	            fos.write(buffer, 0, len);
	        }
			fos.close();
			is.close();
			long endTime = System.currentTimeMillis();
		    System.out.println("download(" + url + "," + filename + ") : completed download - " + ((endTime - startTime) / 1000) + "s");

		} catch (IOException e) {
		    e.printStackTrace();
		}

    }

    private void gzExtract()
    {
    	long startTime = System.currentTimeMillis();
		System.out.println("gzExtract: " + filename);
		
		byte[] buffer = new byte[1024];
	     
	     try{
	 
	    	 GZIPInputStream gzis = 
	    		new GZIPInputStream(new FileInputStream(filename));
	 
	    	 FileOutputStream out = 
	            new FileOutputStream(filename.replace(".gz", ""));
	 
	        int len;
	        while ((len = gzis.read(buffer)) > 0) {
	        	out.write(buffer, 0, len);
	        }
	 
	        gzis.close();
	    	out.close();
			long endTime = System.currentTimeMillis();
			System.out.println(filename + " extracted successfully - " + ((endTime - startTime) / 1000) + "s");
		
	    }catch(IOException ex){
	       ex.printStackTrace();   
	    }
    }

    private void bzipExtract()
    {
		long startTime = System.currentTimeMillis();
		System.out.println("bzipExtract " + filename);
		
		Process p;
		try {
			System.out.println("lbzip2 -d " + filename);
			p = Runtime.getRuntime().exec("lbzip2 -d " + filename);
			p.waitFor();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
 
			String line = "";			
			while ((line = reader.readLine())!= null) {
				System.out.println(line + "\n");
			}
 
		} catch (IOException ioe){
			System.out.println("lbzip2 is not installed, performance will be seriously reduced");
			
			try {
				System.out.println("bzip2 -d " + filename);
				p = Runtime.getRuntime().exec("bzip2 -d " + filename);
				p.waitFor();
				BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
	 
				String line = "";			
				while ((line = reader.readLine())!= null) {
					System.out.println(line + "\n");
				}
	 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		catch (Exception oe) {
			oe.printStackTrace();
		}
		
		
		long endTime = System.currentTimeMillis();
		System.out.println(filename + " extracted successfully - " + ((endTime - startTime) / 1000) + "s");
		
    }
    
}
