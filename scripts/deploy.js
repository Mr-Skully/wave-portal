async function main( ) {
    const [deployer] = await hre.ethers.getSigners( );

    console.log(`Deploying contracts using ${deployer.address}`);
    console.log(`Account Balance: ${(await deployer.getBalance( )).toString( )}`);

    const Token = await hre.ethers.getContractFactory("WavePortal");
    const token = await Token.deploy( );

    console.log(`Deployed WavePortal Contract @ ${token.address}`);
}

main( )
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
