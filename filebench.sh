sudo bash setup.sh
sudo /usr/local/filebench/filebench -f ../fbscripts/fileserver.f
sudo bash setup.sh
sudo /usr/local/filebench/filebench -f ../fbscripts/webserver.f
sudo bash setup.sh
sudo /usr/local/filebench/filebench -f ../fbscripts/webproxy.f
sudo /usr/local/filebench/filebench -f ../fbscripts/varmail.f

sudo bash setup.sh
sudo /usr/local/filebench/filebench -f ../tests/tools/fbscripts/varmail.f