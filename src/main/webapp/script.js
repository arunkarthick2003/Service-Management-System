function blockSpecialCharacters(e) {
            let key = e.key;
            let keyCharCode = key.charCodeAt(0);
			
			// BS-TAB
			if(keyCharCode >= 8 && keyCharCode <= 11) {
                return key;
            }
            
            //SPACE
            if(keyCharCode ===32){
				return key;
			}
			
            // ,-./ 0-9
            if(keyCharCode >= 44 && keyCharCode <= 57) {
                return key;
            }
            
            // A-Z
            if(keyCharCode >= 64 && keyCharCode <= 90) {
                return key;
            }
            
            //_
            if(keyCharCode ===95){
				return key;
			}
            
            // a-z
            if(keyCharCode >= 97 && keyCharCode <= 122) {
                return key;
            }
            
            //DEL
            if(keyCharCode ===127){
				return key;
			}

            return false;
    }
//(k===32) || (k===127) || || (k === 95))