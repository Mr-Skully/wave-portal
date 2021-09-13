async function main() {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy({value: hre.ethers.utils.parseEther("0.1")});
    await waveContract.deployed();
    console.log(`Deployed WavePortal at ${waveContract.address}`);
    console.log(`Deployed by ${owner.address}`);

    let waveCount = await waveContract.getTotalWaves();
    let contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log(`Contract balance: ${hre.ethers.utils.formatEther(contractBalance)}`);

    let waveTxn = await waveContract.wave("Summer of '69");
    await waveTxn.wait();

    waveCount = await waveContract.getTotalWaves();
    contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log(`Contract balance: ${hre.ethers.utils.formatEther(contractBalance)}`);

    waveTxn = await waveContract.connect(randomPerson).wave("Fields of Gold");
    await waveTxn.wait();

    waveCount = await waveContract.getTotalWaves();
    contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
    console.log(`Contract balance: ${hre.ethers.utils.formatEther(contractBalance)}`);

    let allWaves = await waveContract.getWaves();
    console.log(allWaves);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });