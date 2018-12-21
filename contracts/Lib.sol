pragma solidity ^0.4.4;

library Lib{
    function stringToAddress(string s) public pure returns (address) {
        uint160 m = 0;
        uint160 b = 0;
        
        for (uint8 i = 0; i < 20; i++) {
            m *= 256;
            b = uint160(bytes(s)[i]);
            m += (b);
        }
        return address(m);
    }

    function addressToString(address x) public pure returns (string) {
        bytes memory b = new bytes(20);
        uint8 nTemp;
        for (uint i = 0; i < 20; i++) {
            nTemp = uint8(uint(x) / (2**(8*(19 - i))));
            b[i] = byte(nTemp);            
        }

        return string(b);
    }

    function mergeStrings(string s1, string s2) public pure returns (string)
    {
        bytes memory d1 = bytes(s1);
        bytes memory d2 = bytes(s2);
        bytes memory de = "|";

        bytes memory result = new bytes(d1.length + d2.length + de.length);

        for(uint n = 0 ; n < d1.length; n++) {
            result[n] = d1[n];
        }

        uint i = d1.length;
        for(n = 0 ; n < de.length; n++) {
            result[i + n] = de[n];
        }

        i = d1.length + de.length;
        for(n = 0 ; n < d2.length; n++) {
            result[i + n] = d2[n];
        }
        return string(result);
    }

    function intToStr(int n) public pure returns (string)
    {
        uint length=10;
        uint i = 0;int d;int t;int v = n;
        if(n < 0) {
            v *= -1;
        }

        for(uint j = 1; j < length; j++) {
            d = int(10 ** (length - j));

            t = v % d;
            if((v-t)/d > 0) {
                length = (length - j) + 1;
                break;
            }
        }

        bytes memory buffer;
        if(n < 0) {
            buffer = new bytes(length + 1);
            buffer[i] = byte("-");
            i  = 1;
        } else {
            buffer = new bytes(length);
        }

        for(j = 1;j <= length; j++) {
            d = int(10 ** (length - j));

            t = v % d;
            if((v - t) / d > 0) {
                buffer[i] = byte(((v-t) /d) + 48);
                v -= ((v-t) / d) * int(10 ** (length - j));
                i++;
            }

        }
        return string(buffer);
    }  


/*
    function strToByte(string str) public pure returns (byte[100])
    {
        bytes memory d = bytes(str);
        byte[100] memory buffer;

        for(uint i = 0 ; i < 100; i++) {
            if(i < d.length) {
                buffer[i] = byte(d[i]);
            } else {
                buffer[i] = 0x00;
            }
        }
        return buffer;
    }    

    function strToByte1000(string str) public pure returns (byte[1000])
    {
        bytes memory d = bytes(str);
        byte[1000] memory buffer;
        for(uint i = 0 ; i < 1000; i++) {
            if(i < d.length) {
                buffer[i] = byte(d[i]);
            } else {
                buffer[i] = 0x00;
            }
        }
        return buffer;
    }   
    */
}
