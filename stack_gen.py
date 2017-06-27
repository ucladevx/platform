""" Generates a stack given a docker configuration.
Currently only supports a limited setup
"""
from __future__ import print_function
import os
import shutil
import yaml

def create_stack(stack):
    """ Create the web stack given a stack name
    The function checks the base/ folder for the stack and copies
    it to the current directory. Development with that stack should
    happen in that folder.
    """
    # PRECONDITION: `stack` is a valid stack in base/
    try:
        # check if this stack has already been generated
        os.stat(stack)
        # copy the stack directory
        shutil.copytree('base/%s/template'%stack, stack)
    except OSError:
        # the stack already exists. do not overwrite it.
        print("A folder with the name '%s/' already exists."%stack)
        print("To avoid potentially deleting important data, this stack was not generated.")
    except shutil.Error as error:
        # An error in copying occurred
        print("An error occurred while copying '%s/' to '%s/:"%('base/%s/template'%stack, stack))
        print(error)

def generate():
    """Read the docker-compose.yml file and generate the necessary stacks"""
    # Open the docker-compose.yml file
    with open('docker-compose.yml', 'r') as yaml_file:
        # read the docker configuration yfile
        yaml_read = yaml.safe_read(yaml_file)
        create_web = []
        create_db = []

        # iterate through all services
        for service in yaml_read["services"].keys():
            try:
                # make sure the service exists and has a template
                os.stat("base/%s"%service)

                if service.startswith("web"):
                    create_web.append(service.split("web_")[1])
                if service.startswith("db"):
                    create_db.append(service.split("db_")[1])
            except OSError:
                # either invalid service or no template required for stack
                print("No configuration for stack element '%s'. Skipping."%service)
        # generate stacks
        print("Generating web stack(s)...")
        for stack in create_web:
            print(" --> %s"%stack)
            create_stack(stack)
        print("Generating db stack(s)...")
        for stack in create_db:
            print(" --> %s"%stack)
            create_stack(stack)

if __name__ == '__main__':
    generate()
    