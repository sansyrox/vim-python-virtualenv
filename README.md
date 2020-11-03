# vim-python-virtualenv

A vim plugin which automatically manages the python virtual envs for you. Almost zero config required.

## Installation

You can install the plugin using the following command:

`Plug 'sansyrox/vim-python-virtualenv'`

Now, you need to set your python host prog in your vimrc. 

` let g:python3_host_prog='/usr/bin/python3'`

This step assumes that you have python installed as you are managing virtualenvs of python.

## Usage

1. Start your venv, e.g.: `source venv/bin/activate`

2. Start Vim from the same session: `vim/nvim .` (At this point the plugin will do it's magic and you can reference the venv specific modules from vim directly)
