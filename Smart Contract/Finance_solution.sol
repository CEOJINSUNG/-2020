//Solidity 버전 불러오기
pragma solidity >=0.4.22 <0.7.0;

//사용내역 업로드 및 선언
contract Finance {
    address public Council;
    address public last_sender;
    uint public Council_received_wei;

    //이벤트 선언
    event Newfinance(string purpose, string subject, string price, string amount, string totalprice);

    //사용내역 구조체 선언
    struct UseResult {
        string purpose;
        string subject;
        string price;
        string amount;
        string totalprice;
    }

    //useresult라는 사용내역 배열 선언
    UseResult[] public useresults;

    struct people {
        uint money; //보유금
        address peopleId; //아이디
    }

    mapping (address => people) peoples;
    
    //사용내역 업로드 함수 선언
    //이벤트 선언
    function putResult(string memory _purpose, string memory _subject, string memory _price, string memory _amount, string memory _totalprice) public {
        useresults.push(UseResult(_purpose, _subject, _price, _amount, _totalprice));
        emit Newfinance(_purpose, _subject, _price, _amount, _totalprice);
    }

    //사용내역 불러오는 함수 선언
    function getResult(uint _number) public view returns(string memory getpurpose, string memory getsubject, string memory getprice, string memory getamount, string memory gettotalprice){
        getpurpose = useresults[_number].purpose;
        getsubject = useresults[_number].subject;
        getprice = useresults[_number].price;
        getamount = useresults[_number].amount;
        gettotalprice = useresults[_number].totalprice;
    }
    
    function sending() payable public {
        last_sender = msg.sender;
        Council_received_wei += msg.value;
        peoples[msg.sender].money -= msg.value;
    }
}