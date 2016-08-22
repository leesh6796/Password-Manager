/*
	Copyright �� AirWater All Rights Reserved.
	�ۼ��� : �̻���
	�̸��� : leesh6796@gmail.com
	���� : AirWater
*/

var contentType = 'application/x-www-from-urlencoded'; // Content Type

var ajaxValueSave = '';

function Encrypt(text)
{
	return escape(encodeURIComponent(text), false);
}

/*
	get[POST/GET] : ��������� ������ ����
	send[POST/GET] : �񵿱������ ������ ����
*/

// data ex:) header=useWidget&meme=a
function getPOST(url, data)
{
	var returnValue = $.ajax({
			type: "POST",
			url: url,
			data: data,
			async: false,
		}).responseText;

	return returnValue;
}

function getGET(url, data)
{
	var returnValue = $.ajax({
			type: "GET",
			url: url,
			data: data,
			async: false,
		}).responseText;

	return returnValue;
}

// Send �޼������ �����͸� JSON ������� �Ѱܾ� �Ѵ�.
function sendPOST(url, data, success, error)
{
	$.post(url, data, success, error);
}

function sendGET(url, data, success, error)
{
	$.get(url, data, success, error);
}

//�׳� n millis ���� ���߱�
function pause(numberMillis)
{
     var now = new Date();
     var exitTime = now.getTime() + numberMillis;

     while(true)
     {
          now = new Date();
          if (now.getTime() > exitTime)
              return;
     }
}

/*
 * success�� function(msg) { }�� �⺻���� ��
 * type�� POST�� GET�� ����
 * contentType�� �⺻�� application/x-www-from-urlencoded
 * data�� "name=��&value=��" �̷������� ���
*/