const { expect } = require('chai');
const { ethers } = require('hardhat');


describe(' Lottery ', function () {
    beforeEach(async () => {
        [owner, signer1, signer2, signer3, signer4, signer5] = await ethers.getSigners();

        Lottery = await ethers.getContractFactory('Lottery', owner);
        lottery = await Lottery.deploy();
    });



describe('deploy', function() {
    it('should set owner', async function() {
        expect(await lottery.owner()).to.equal(owner.address)
    });

    it('allows 1 account to enter', async() => {
        await lottery.utils.enter().send({
            from: owner.address,
            value: ethers.utils.parseEther('0.02')
        });

        const players = await lottery.utils.getPlayers().call({
            from: owner.address
        });

        
    })


});




});