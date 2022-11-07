# Suggested Requirements​ for hardware

## Fullnode​

VPS running recent versions of Mac OS X or Linux.
IMPORTANT 2T GB of free disk space, solid-state drive(SSD), gp3, 8k IOPS, 250MB/S throughput, read latency <1ms. (if start with snap/fast sync, it will need NVMe SSD)
16 cores of CPU and 64 gigabytes of memory (RAM).
Suggest m5zn.3xlarge instance type on AWS, c2-standard-16 on Google cloud.
A broadband Internet connection with upload/download speeds of 5 megabyte per second

## Validator​

VPS running recent versions of Mac OS X or Linux.
IMPORTANT 2T GB of free disk space, solid-state drive(SSD), gp3, 8k IOPS, 250MB/S throughput, read latency <1ms
16 cores of CPU and 64 gigabytes of memory (RAM)
Suggest m5zn.3xlarge instance type on AWS, or c2-standard-16 on Google cloud.
A broadband Internet connection with upload/download speeds of 10 megabyte per second

# Sync From Genesis Block
1.Build from source code

Make sure that you have installed Go 1.13+ and have added GOPATH to PATH environment variable

    git clone https://github.com/Ankr-network/bas-template-bsc

### Enter the folder bsc was cloned into

    cd bas-template-bsc
    git checkout devel
    apt install  make gcc musl-dev linux-headers-generic git bash ca-certificates curl jq tini


### Compile and install bsc

    make geth
or you can download the pre-build binaries from release page or follow the instructions below:

## Linux

    wget $(curl -s https://api.github.com/repos/Frozen-Games/fro-mainnet-setup/releases/latest |grep browser\_ |grep geth_linux |cut -d\" -f4)


2.Download the config files

Download genesis.json 

## mainet

    wget $(curl -s https://api.github.com/repos/Frozen-Games/fro-mainnet-setup/releases/latest |grep browser\_ |grep genesis |cut -d\" -f4)


3.Write genesis state locally
    
    apt install  make gcc musl-dev linux-headers-generic git bash ca-certificates curl jq tini
    mv geth_linux geth
    chmod +x geth
    ./geth --datadir node init genesis.json

You could see the following output:

    INFO [05-19|14:53:17.468] Allocated cache and file handles database=/Users/huangsuyu/Downloads/bsc/node/geth/chaindata cache=16.00MiB handles=16
    INFO [05-19|14:53:17.498] Writing custom genesis block
    INFO [05-19|14:53:17.501] Persisted trie from memory database nodes=21 size=56.84KiB time=357.915µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=-574.00B
    INFO [05-19|14:53:17.502] Successfully wrote genesis state database=chaindata hash=7d79cc…fb0d1e
    INFO [05-19|14:53:17.503] Allocated cache and file handles database=/Users/huangsuyu/Downloads/bsc/node/geth/lightchaindata cache=16.00MiB handles=16
    INFO [05-19|14:53:17.524] Writing custom genesis block
    INFO [05-19|14:53:17.525] Persisted trie from memory database nodes=21 size=56.84KiB time=638.396µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=-574.00B
    INFO [05-19|14:53:17.528] Successfully wrote genesis state database=lightchaindata hash=7d79cc…fb0d1e

4.Start your fullnode

Start a validator node

## generate the consensus key and input the password

    ./geth account new --datadir ./datadir
    echo {your-password} > password.txt
    ./geth --datadir=./datadir --genesis=./datadir/genesis.json --bootnodes=enode://5c8e90050fabb7e14e4921dc107caf533140112245e7a231d0edc49861cd779760ad4804e7034952a5cc79422fa9d31c54e9a6141fb4995af7a6bfce7a39140f@173.212.209.188:30303 --networkid=120 --gcmode=archive --syncmode=full --http --http.addr=0.0.0.0 --http.api=eth,net,web3,debug,txpool --http.port=8545 --http.corsdomain=* --http.vhosts=* --ws --ws.addr=0.0.0.0 --ws.api=eth,net,web3,debug,txpool --ws.port=8546 --ws.origins=*



5.Monitor node status

you can monitor the log from /node/bsc.log by default.
