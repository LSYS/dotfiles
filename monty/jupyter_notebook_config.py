# Configuration file for jupyter-notebook.

c = get_config()  #noqa


#------------------------------------------------------------------------------
# NotebookApp(JupyterApp) configuration
#------------------------------------------------------------------------------

## Whether to allow the user to run the notebook as root.
#  Default: False
# c.NotebookApp.allow_root = False

## Answer yes to any prompts.
#  See also: JupyterApp.answer_yes
# c.NotebookApp.answer_yes = False


## Reload the webapp when changes are made to any Python src files.
#  Default: False
# c.NotebookApp.autoreload = False

## Specify what command to use to invoke a web
#                        browser when opening the notebook. If not specified, the
#                        default browser will be determined by the `webbrowser`
#                        standard library module, which allows setting of the
#                        BROWSER environment variable to override it.
#  Default: ''
c.NotebookApp.browser = u'/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe %s'


## Disable launching browser by redirect file
#  
#          For versions of notebook > 5.7.2, a security feature measure was added that
#          prevented the authentication token used to launch the browser from being visible.
#          This feature makes it difficult for other users on a multi-user system from
#          running code in your Jupyter session as you.
#  
#          However, some environments (like Windows Subsystem for Linux (WSL) and Chromebooks),
#          launching a browser using a redirect file can lead the browser failing to load.
#          This is because of the difference in file structures/paths between the runtime and
#          the browser.
#  
#          Disabling this setting to False will disable this behavior, allowing the browser
#          to launch by using a URL and visible token (as before).
#  Default: True
c.NotebookApp.use_redirect_file = False
