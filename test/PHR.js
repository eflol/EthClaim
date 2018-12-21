var PHR = artifacts.require("./PHR.sol");

contract
('PHR', function(accounts) 
	{
		it("should put 10000 PHR in the first account", 
			function() 
			{
				return PHR.deployed().then
					(	
						function(instance) 
						{
							return instance.getMRLength.call("酒公 林家唱");
						}
					).then
						(	
							function(balance) 
							{
								assert.equal(balance.valueOf(), 10000, "10000 wasn't in the first account");
							}
						);
			}
		);

		it("should call a function that depends on a linked library", 
			function() 
			{
				var meta;
				var PHRBalance;
				var PHREthBalance;

				return PHR.deployed().then
					(
						function(instance) 
						{
							meta = instance;
							return meta.getMRLength.call("酒公 林家唱");
						}
					).then
					(
						function() 
						{
							assert.equal(PHREthBalance, 2 * PHRBalance, "Library function returned unexpected function, linkage may be broken");
						}
					);
			}
		);
		
		it("should send coin correctly", 
			function() 
			{
				var meta;

				// Get initial balances of first and second account.
				var account_one = accounts[0];
				var account_two = accounts[1];

				var account_one_starting_balance;
				var account_two_starting_balance;
				var account_one_ending_balance;
				var account_two_ending_balance;

				var amount = 10;

				return PHR.deployed().then
					(
						function(instance) 
						{
							meta = instance;
							return meta.getMRLength.call("酒公 林家唱");
						}
					);
			}
		);
	}
);
