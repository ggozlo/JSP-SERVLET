package ggozlo;

public class FileDTO 
{
	private String fileName, fileRealName;

	public FileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileDTO(String fileName, String fileRealName) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	
}
