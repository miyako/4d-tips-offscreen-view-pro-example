//%attributes = {"invisible":true}
$xlsxFile:=Folder:C1567(fk resources folder:K87:11).file("test.xlsx")
$pdfFile:=Folder:C1567(fk desktop folder:K87:19).file("test.pdf")

//$1@myVpConverter, This@myVpProcessor
$myVpConverterParams:=New object:C1471
$myVpConverterParams.src:=$xlsxFile
$myVpConverterParams.dst:=$pdfFile
$myVpConverterParams.password:=""
$myVpConverterParams.formula:=Formula:C1597(myVpImporter)  //既定のパラメーターがあるのでバインドしない

//$1@myVpExporter, This@myVpConverter
$params:=New object:C1471
$params.area:="tempVpArea"  //エリア名は何でも良い
$params.onEvent:=Formula:C1597(myVpConverter($myVpConverterParams))  //ローカル変数をパラメーターにバインド
$params.autoQuit:=False:C215  //ロードした後にコードを実行したいのでFalse
$params.timeout:=10
$params.result:=Null:C1517

//$1@myVpProcessor
$myVpProcessorParams:=New object:C1471
$myVpProcessorParams.that:=$params  //This@myVpConverterをthatで参照できるように・・・
$myVpConverterParams.onSuccess:=Formula:C1597(myVpProcessor($myVpProcessorParams))
$myVpConverterParams.onError:=Formula:C1597(myVpProcessor($myVpProcessorParams))
$myVpProcessorParams.format:=vk PDF format:K89:21
$myVpProcessorParams.password:=""
$myVpProcessorParams.formula:=Formula:C1597(myVpExporter)  //既定のパラメーターがあるのでバインドしない
$myVpProcessorParams.valuesOnly:=True:C214
$myVpProcessorParams.includeFormatInfo:=False:C215
$myVpProcessorParams.sheetIndex:=vk workbook:K89:4
$myVpProcessorParams.pdfOptions:=New object:C1471
$myVpProcessorParams.pdfOptions.creator:="creator"
$myVpProcessorParams.pdfOptions.title:="title"
$myVpProcessorParams.pdfOptions.author:="author"
$myVpProcessorParams.pdfOptions.keywords:="keywords"
$myVpProcessorParams.pdfOptions.subject:="subject"

C_VARIANT:C1683($result)
$result:=VP Run offscreen area($params)

If ($result#Null:C1517)  //タイムアウトの場合はNull
	If ($result.success)
		OPEN URL:C673($pdfFile.platformPath)
	End if 
End if 

//SpreadJSでエクスポートができたフォントは・・・
//メイリオ