using System.IO;
using System.IO.Compression; 

String filePath = @"C:\temp\unzipLocation\UserAdmin.bak.gz";
String newFileName = Path.GetDirectoryName(filePath) + @"\" + Path.GetFileNameWithoutExtension(filePath);
FileInfo fi = new FileInfo(filePath);

using (FileStream originalFileStream = fi.OpenRead())
{
	using (FileStream decompressedFileStream = File.Create(newFileName))
	{
		using (GZipStream decompressionStream = new GZipStream(originalFileStream, CompressionMode.Decompress))
		{
			decompressionStream.CopyTo(decompressedFileStream);
		}
	}
}
			
			