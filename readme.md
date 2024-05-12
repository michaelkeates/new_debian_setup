<p align="center">
  <img src="https://repository-images.githubusercontent.com/692780762/0ca1031a-ffad-434b-8fab-f6074d020b94" width="300px" height="300px"/>
</p>
<h1 align="center">Bash Scripts</h1>

Personal Bash scripts for automation 🤓
<br></br>

<br>
<h1 align="left">How to Use</h1>
<h2 align="left">Docker Setup</h2>
<h3 align="left">Install Dependencies</h3>
<ul>
<li>Run script below</li>
	<pre class="gitcode">wget -O - https://raw.githubusercontent.com/michaelkeates/new_debian_setup/main/docker/script.sh | bash</pre>
</ul>

<h3 align="left">Install Nix</h3>
<ul>
	<pre class="gitcode">curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install</pre>
</ul>

<h3 align="left">Create Keys</h3>
<ul>
	<pre class="gitcode">nix run github:michaelkeates/nixos-config#createKeys</pre>
</ul>

<h3 align="left">Initialize</h3>
<ul>
	<pre class="gitcode">nix flake init -t github:michaelkeates/nixos-config#default</pre>
</ul>

<h3 align="left">Installation</h3>
<ul>
<li>For the first-time, it is required to move the current /etc/nix/nix.conf out of the way</li>
<pre class="gitcode">sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin</pre>
<li>Then finally run the script below. This wraps the Nix commands, builds and deploys a new Nix Generation as well as removes files that will crash the script.</li>
<pre class="gitcode">chmod +x bin/darwin-build && chmod +x bin/build && bin/build</pre>
</ul>
<br></br>
<h2 align="left">NixOS</h2>
<h3 align="left">Create Keys</h3>
<ul>
	<pre class="gitcode">nix run github:michaelkeates/nixos-config#createKeys</pre>
</ul>
<li>This opens an editor to accept, encrypt, and write your secret to disk. Then push the age file to your private github repo</li>
<ul>
    <pre class="gitcode">EDITOR=vim nix run github:ryantm/agenix -- -e secret.age</pre>
</ul>
<h3 align="left">Installation</h3>
<ul>
	<pre class="gitcode">nix run --experimental-features 'nix-command flakes' github:michaelkeates/nixos-config#install</pre>
</ul>
<br>
<h1 align="left">Rebuild</h1>
<h3 align="left">MacOS & NixOS</h3>
<ul>
	<pre class="gitcode">nix run github:michaelkeates/nixos-config#rebuild</pre>
</ul>
<h3 align="left">Mentions</h3>
<ul>
<p>dustinlyons for his Nix configuration files that this is heavily based on and what I learnt from so all rights to him.</p><a href="https://github.com/dustinlyons/nixos-config">Repository</a>
</ul>
<h3 align="left">Author</h3>
<ul>
Michael Keates <a href="https://www.michaelkeates.co.uk">Website</a>
</ul>
