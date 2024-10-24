// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ERC20 standard interface
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract MyToken is IERC20 {
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;  // The contract deployer becomes the owner
        _totalSupply = initialSupply * (10 ** uint256(decimals));  // Set the total supply with the decimal factor
        _balances[owner] = _totalSupply;  // Assign the entire supply to the owner
        emit Transfer(address(0), owner, _totalSupply);  // Emit a transfer event from 0x0 to owner
    }

    // Return the total supply of the token
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    // Return the balance of a specific account
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    // Transfer tokens to a recipient
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(_balances[msg.sender] >= amount, "Insufficient balance");
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // Allow spender to spend a specified amount of tokens on behalf of the owner
    function approve(address spender, uint256 amount) public override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // Transfer tokens on behalf of an owner using an approved allowance
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(_balances[sender] >= amount, "Insufficient balance");
        require(_allowances[sender][msg.sender] >= amount, "Allowance exceeded");

        _balances[sender] -= amount;
        _balances[recipient] += amount;
        _allowances[sender][msg.sender] -= amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    // Check how much a spender is allowed to spend on behalf of an owner
    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    // Mint new tokens (only the contract owner can mint tokens)
    function mint(uint256 amount) public onlyOwner {
        _totalSupply += amount * (10 ** uint256(decimals));
        _balances[owner] += amount * (10 ** uint256(decimals));
        emit Transfer(address(0), owner, amount * (10 ** uint256(decimals)));
    }

    // Burn tokens (destroy tokens from the owner's balance)
    function burn(uint256 amount) public onlyOwner {
        require(_balances[owner] >= amount, "Insufficient balance to burn");
        _totalSupply -= amount * (10 ** uint256(decimals));
        _balances[owner] -= amount * (10 ** uint256(decimals));
        emit Transfer(owner, address(0), amount * (10 ** uint256(decimals)));
    }
}
