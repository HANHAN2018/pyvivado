#!/usr/bin/env bash

# First analyze the design files.
vhdlan {% for design_file in design_files %}{{design_file}} {% endfor %}{% for simulation_file in simulation_files %}{{simulation_file}} {% endfor %}
if [ $? -ne 0 ]; then
  echo "ERROR: Failure running vhdlan. Testing."
  exit 1
fi

# Create the simulation executable.
vcs FileTestBenchWrapped
if [ $? -ne 0 ]; then
  echo "ERROR: Failure running VCS compilation."
  exit 1
fi

# And run it
./simv
if [ $? -ne 0 ]; then
  echo "ERROR: Failure running simulation executable ."
  exit 1
fi

exit 0
