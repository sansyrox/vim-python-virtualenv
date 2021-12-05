python3 << EOF
import os
import sys
import subprocess
import re

if "VIRTUAL_ENV" in os.environ:
    print("Python venv detected. Attempting to update environment variables...")
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode("utf8").splitlines()

    def update_os_environ(line: str) -> None:
        env_var, env_val = line.split("=", 1)
        os.environ[env_var] = env_val
        print("Updateing env var: " + env_var)

    # This variable serves purpose of compiling multi-line env variables
    prev_line = None

    for line in output:
        if re.match(r"^[A-Za-z_%]+=.+", line):
            if prev_line:
                update_os_environ(prev_line)

            prev_line = line
        else:
            prev_line += "\n" + line

    # One last check for prev_line
    if prev_line:
        update_os_environ(prev_line)
EOF
