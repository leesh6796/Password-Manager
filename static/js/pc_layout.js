String.prototype.replaceAll = function(regExp, replaceStr)
{
      var ori = this;
            
      while(true)
      {
            if(ori.indexOf(regExp) < 0)
            {
                  break;
            }
 
            ori = ori.replace(regExp, replaceStr);
      }
 
      return ori;
}

function isPC()
{
	var agent = navigator.userAgent.toLowerCase();
	var filter = new Array('android','iphone','ipad');

	for(var i=0; i<filter.length; i++)
	{
		if(agent.indexOf(filter[i]) != -1)
			return 0;
	}
	return 1;
}

function layout()
{
	if(isPC() == 1)
	{
		$('.page').css({'padding-left':'30%','padding-right':'30%'});
	}
	else
	{
		$('.btn').after('<br /><br />');
	}

	$('#bt_home').on('click', function() { location.href='/pm'; });
}