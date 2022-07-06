// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Mappings{

    mapping(address => bool) public registered;
    mapping(address => uint) public favNums;


    function register(uint _favNums)public{
       // require(!registered[msg.sender],"Kullaniciniz daha once kayit yapti!"); 
        require(!isRegistered(),"Kullaniciniz daha once kayit yapti!" ); 
        registered[msg.sender] = true;
        favNums[msg.sender] = _favNums;
    }
    function isRegistered() public view returns(bool){
        return registered[msg.sender];
    }


    function deleteRegistered()public{
        require(isRegistered(), "Kullaniciniz kayitli degil!");
        delete(registered[msg.sender]);
        delete (favNums[msg.sender]);



    }
}

contract NestedMapping{

    mapping(address => mapping(address => uint)) public debts;

    //Borç arttır
    function incDebt(address _borrower,uint _amount)public{  
        debts[msg.sender][_borrower] += _amount;

    }
    //Borç azalt
     function decDebt(address _borrower,uint _amount)public{  
         require(debts[msg.sender][_borrower] >= _amount,"O Kadar Borcu yok! ");
        debts[msg.sender][_borrower] -= _amount;

    }
    // Borç Görüntüle
    function getDebt(address _borrower)public view returns(uint256) {
        return debts[msg.sender][_borrower];
    }

}