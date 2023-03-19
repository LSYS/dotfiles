# .files for Windows + WSL
![alt text](misc/img/mugshot.png)

## My key concerns/needs

* Install using package managers whenever possible (`apt`, `brew`, `winget`, `choco`, `npm`)
* Main assests (dotfiles, bin/, etc.) are symlinked from this repo into `$HOME`
* (Mini)Conda, Jupyter, Python
* LaTeX + reveal-md for typesetting
* Bash should be properly set up with prompts (via `Oh-My-Posh`)

## Installation

### Using the bootstrap script
The **`bootstrap.sh`** file will take care of installing almost everything in my Linux subsystem. Just `cd` into the local folder of this repo and run `./bootstrap.sh`. This `bootstrap.sh` script calls the individual installers to set up the dotfiles, `bin/`, and package installers using `APT`, `Homebrew` (`Linuxbrew`), and `NPM`.

```shell
cd $HOME 
git clone https://github.com/LSYS/dotfiles.git
cd dotfiles
./bootstrap.sh
```

### Using the PowerShell scripts
The `PowerShell` scripts in `win/` will take care of installing Windows OS applications using `winget` and, to a smaller extent for applications that cannot be installed from `winget`, `Chocolatey`. The `winget.ps1` installs the desktop application and basic utilities. The `choco.ps1` installs mainly `LaTeX` and `PostgreSQL`.

To install apps using `winget` and `Chocolatey`:
```PowerShell
cd win
./winget.ps1
./choco
```

`choco.ps1` requires PowerShell admin priviledges:
```PowerShell
./choco.ps1
```

### Order of installation (Win)

* Install `WSL`: Open `PowerShell` as administrator 
  ```PowerShell
  wsl --install -d Debian
  # confirm that bash is running
  which $SHELL
  ```
  
* Install Native Windows apps: Open `PowerShell`
  ```PowerShell
  ./winget.ps1
  ./choco.ps1
  ```
  This will install `WindowsTerminal` and `Oh-My-Posh`. Type
  ```PowerShell
  oh-my-posh font install
  ```
  to install the fonts and choose Meslo (recommended). Seth the font in WindowTerminal setting (settings.json)
  ```json
  {
      "profiles":
      {
          "defaults":
          {
              "font":
              {
                  "face": "MesloLGM NF"
              }
          }
      }
  }
  ```
* Open WSL (`Debian`) in WindowsTerminal and run the `bootstrap.sh` installer:
  ```bash
  cd $HOME/dotfiles && ./bootstrap.sh
  ```
  This will call the following installers:
  * `dotfiles.sh`
  * `bin/install.sh`
  * `apt/install.sh`
  * `brew/install.sh`
  * `npm/install.sh`
  * `monty/install.sh`

* Once `Oh-My-Posh` is installed via `brew/install.sh`. Check that it works
  ```bash
  eval "$(oh-my-posh init bash)"
  ```
  and symlink the poshthemes to home (where `bash/.bash_profile` will look for the themes)
  ```bash
  cd $HOME && mkdir poshthemes && cd poshthemes
  ln -s /home/linuxbrew/.linuxbrew/opt/oh-my-posh/themes/* 
  ```

## Additional Details

### Bash

* `.exports`: for Environment variables (e.g., custom shell utilities and `conda` is specified here)

Will be installed in ???

`.bash_profile` is the first config that will be read by `bash`. So this file will source all other relevant dotfiles.


### References:

* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
  <details>
  <summary>(More notes)</summary>
  <ul>
    <li>Using his compartmentalization of `bash` dotfiles (bashrc, bash_profile, exports, functions, etc.) but using them in terms of a topical organization (so all of them are in `bash/`.</li>
    <li>`.functions`
    <li>Using his way of putting shell scripts in `bin/`
  </ul>
  </details>
  
* [`webpro`'s Getting started with dotfiles](https://www.webpro.nl/articles/getting-started-with-dotfiles)
  <details>
  <summary>(More notes)</summary>
  <ul>
    <li>Using his way of using a `.functions` for shell scripts too complex for an alias (for `.bash_aliases`) but too small for stand-alone scripts (like in `bin/`). (This is of course a judgement call.)
    </li>
    <li>He is more explicit on the compartmentalizing of dotfiles
    </li>
  </ul>
  </details>
* Topical organization  
    <details>
    <summary>(More notes)</summary>
    <ul>
      <li>
      <a href="https://driesvints.com/blog/getting-started-with-dotfiles/">Dries Vints's Getting Started with Dotfiles</a>
      </li>
      <li>
      <a href="https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/">Zach Holman's Dotfiles Are Meant to Be Forked</a>
      </li>
    </ul>
    </details>
  
* [Wynn Netherland's Dotfiles discovery](https://wynnnetherland.com/journal/dotfiles-discovery)  
    <details>
    <summary>(More notes)</summary>
    <ul>
      <li>
      Just do a search for known config file names on GitHub
      </li>
    </ul>
    </details>
    
(`webpro`'s (Lars Kappert) [curated resources](https://github.com/webpro/awesome-dotfiles) is a good one to find other resources.)    
