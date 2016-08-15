<cfset paths = arrayNew(1)>
<cfset paths[1] = expandPath("qrCore.jar")>
<cfset loader = createObject("component","qrJavaLoader.JavaLoader").init(paths)>
<cfset BarcodeFormat = loader.create('com.google.zxing.BarcodeFormat')>
<cfset QRCodeWriter = loader.create('com.google.zxing.qrcode.QRCodeWriter').init()>
<cfset MatrixToImageWriter = loader.create('com.google.zxing.client.j2se.MatrixToImageWriter')>


<cfset QRText="Created at " & dateTimeFormat(NOW(), 'yyyy-mm-dd HH:nn:ss') & " by https://github.com/mohokh67">
<cfset QRcode=QRCodeWriter.encode("#QRText#",BarcodeFormat.QR_CODE,200,200)>
<cfset image=ImageNew( MatrixToImageWriter.toBufferedImage(QRcode))>
<cfset QRImageFilename="qrTest.png">
<cfimage action="write" source="#image#" format="png" destination="#expandPath(QRImageFilename)#" overwrite="true" quality="1">

<cfdocument  format="pdf" fontEmbed="Yes" pageType="A4" unit="cm" marginbottom="0" margintop="0" marginleft="0" marginright="0" overwrite="yes">
	<h1>Scan this QR code please...</h1>
	<img src='qrTest.png'>
</cfdocument>