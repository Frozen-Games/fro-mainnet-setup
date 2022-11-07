# Suggested Requirements​ for hardware

## Fullnode​

VPS running recent versions of Linux.
IMPORTANT 2T GB of free disk space, solid-state drive(SSD), gp3, 8k IOPS, 250MB/S throughput, read latency <1ms. (if start with snap/fast sync, it will need NVMe SSD)
16 cores of CPU and 64 gigabytes of memory (RAM).
Suggest m5zn.3xlarge instance type on AWS, c2-standard-16 on Google cloud.
A broadband Internet connection with upload/download speeds of 5 megabyte per second

## Validator​

VPS running recent versions of Linux.
IMPORTANT 2T GB of free disk space, solid-state drive(SSD), gp3, 8k IOPS, 250MB/S throughput, read latency <1ms
16 cores of CPU and 64 gigabytes of memory (RAM)
Suggest m5zn.3xlarge instance type on AWS, or c2-standard-16 on Google cloud.
A broadband Internet connection with upload/download speeds of 10 megabyte per second

# Sync From Genesis Block
1. install prerequirements
   
    apt install  make gcc musl-dev linux-headers-generic git bash ca-certificates curl jq tini

2. Build from source code

Make sure that you have installed Go 1.13+ and have added GOPATH to PATH environment variable and install following packages

    git clone https://github.com/Ankr-network/bas-template-bsc

### Enter the folder bsc was cloned into

    cd bas-template-bsc
    git checkout fe83fc508fe71f8fd0d61d5f26158107a2fc8b21
    


### Compile and install bsc

    make geth

or you can download the pre-build binaries from release page or follow the instructions below:

## Linux

    wget $(curl -s https://api.github.com/repos/Frozen-Games/fro-mainnet-setup/releases/latest |grep browser\_ |grep geth_linux |cut -d\" -f4)
    mv geth_linux geth
    chmod +x geth


3. Download the config files

Download genesis.json 

## mainet

    wget $(curl -s https://api.github.com/repos/Frozen-Games/fro-mainnet-setup/releases/latest |grep browser\_ |grep genesis |cut -d\" -f4)
    
4. Start your fullnode

Start a validator node

## generate the consensus key and input the password

    mkdir datadir
    ./geth account new --datadir ./datadir
    echo {your-password} > password.txt
    mv genesis.json ./datadir
    ./geth --datadir=./datadir --genesis=./datadir/genesis.json --mine --password=./datadir/password.txt --allow-insecure-unlock --unlock={your validator address} --miner.etherbase={your validator address}  --bootnodes=enode://5c8e90050fabb7e14e4921dc107caf533140112245e7a231d0edc49861cd779760ad4804e7034952a5cc79422fa9d31c54e9a6141fb4995af7a6bfce7a39140f@173.212.209.188:30303 --networkid=120 --gcmode=archive --syncmode=full

