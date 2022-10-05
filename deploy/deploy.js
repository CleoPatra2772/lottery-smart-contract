async function main() {
    const [owner] = await ethers.getSigners();
    const Lottery = await ethers.getContractFactory('Lottery');
    const lottery = await Lottery.deploy();

    console.log('address: ', lottery.address);


}

main()
.then(() => process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
})