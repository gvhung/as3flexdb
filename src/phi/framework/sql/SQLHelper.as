package phi.framework.sql
{
	public class SQLHelper
	{
		static public function arrayInsert( table:String, array:Object ):String
		{
			var result :String = "";
			var keys :Array = new Array();
			var values :Array = new Array();
			
			for( var item:String in array )
			{
				keys.push( item );
				values.push( array[item] );
			}
			
			result = 'INSERT INTO '+table+' (`'+keys.join('`,`')+'`) VALUES ("'+values.join('","')+'");';		
			return result;
		}
		
		static public function arrayUpdate( table:String, array:Object, cond:String ):String
		{
			var result :String = "";
			var body :String = "";
			
			for( var item:String in array )
			{
				var value :String = "";
				if( array[item] is Number )
					value = array[item];
				else if (array[item] is String )
					value = '"'+ array[item] +'"';
				
				body += "`"+item+'` = ' + value +', ';
			}
			
			body = body.substr(0, body.length-2 );
			result = "UPDATE "+table+" SET "+body+" WHERE "+cond+";";
			return result;	
		}
		
		static public function addslashes( str:String ):String
		{
			return str.replace(/([\\"'])/g, "\\$1").replace(/\0/g, "\\0");
		}
		

			
	}
}