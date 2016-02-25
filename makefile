export OMPI_CXX=g++

compile: main.cpp
	mpic++ -o parallel_pf.exe -g -O3 -DNDEBUG `gdal-config --cflags` `gdal-config --libs` main.cpp -I. -lgdal --std=c++11 -Wall -lboost_filesystem -lboost_system #-Wextra #-fsanitize=undefined #-Wextra -Wconversion

timing:
	mpic++ -o parallel_pf.exe -g -O3 -DNDEBUG `gdal-config --cflags` `gdal-config --libs` main.cpp -I. -lipm -lgdal --std=c++11 -Wall -lboost_filesystem -lboost_system #-Wextra #-fsanitize=undefined #-Wextra -Wconversion

xsede: main.cpp
	mpic++ -o parallel_pf.exe -g -O3 -DNDEBUG `gdal-config --cflags` `gdal-config --libs` main.cpp -I. -lgdal --std=c++11 -Wall -lboost_filesystem -lboost_system -L/opt/boost/intel/mvapich2_ib/lib/ -I/opt/boost/intel/mvapich2_ib/include #-Wextra #-fsanitize=undefined #-Wextra -Wconversion

debug: main.cpp
	mpic++ -o parallel_pf.exe -g     `gdal-config --cflags` `gdal-config --libs` main.cpp -I. -lgdal --std=c++11 -Wall -lboost_filesystem -lboost_system
	#To run with debuggers: mpirun -n 2 xterm -hold  -e gdb -ex run --args ./parallel_pf.exe 0 beauford.tif

clean:
	rm -f output* parallel_pf.exe
