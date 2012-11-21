# CloudFoundry Installer

WARNING: This README currently lives in advance of the features of the installer itself. This is the README that I want to be true when the installer is initially publicly announced. The project is being developed publicly, prior to public announcement, and your participation and testing is appreciated.

## What is CloudFoundry?

CloudFoundry is a platform-as-a-service (PaaS, pronounced 'paz' but with a flavour of 's' to it) for running your applications and services that you can run on one server or 1000. 

Before running this installer on your own infrastructure, you can optionally try CloudFoundry via a publicly hosted service.  [cloudfoundry.com](http://cloudfoundry.com) is the publicly hosted version by VMWare, the creators and core developers of CloudFoundry.

The goal of the CloudFoundry team at VMWare and the growing ecosystem of users and developers around the world is for CloudFoundry to become "the Linux of the Cloud". The vision is that every company running their own datacenter or using public cloud services would use the same, open source PaaS to make it simple, fast and homogenous for application developers, devops, ops and DBAs to perform their jobs. For example, application developers can work fastest and at their most agile, when they can deploy new applications and provision new databases within 30 seconds, rather than within two weeks.

The CloudFoundry PaaS does not add complexity to the running of an application and its services. It makes them all consistent, and then adds layers of tools, services and support around the creating, scaling and lifecycle of the applications and services.

It is all open source, and there is a growing body of documentation and blog posts on how to get started and how to operate your own CloudFoundry. It is fun and it is very much appreciated by everyone else at your company!

This installer gets you started and can keep your CloudFoundry installation up-to-date as new versions are released. It can also allow you to have a custom distribution of CloudFoundry to allow you to include your own runtimes, frameworks and services, as well as your own patches and new features.

## Why CloudFoundry?

Once you have CloudFoundry installed and running (this project!) every user can deploy applications within 30 seconds, instead of two weeks. They will be able to run Java, Ruby, Python, Node.js and PHP applications.

Your users will be able to choose from a wide range of database and messaging services, including PostgreSQL, Redis, AMPQ, MongoDB, MySQL, and Neo4j. You may or may not want to include all of these services in your own running version of CloudFoundry as you will need to provide the DBA assistance. It is recommended to have a Support Service Agreement with Stark & Wayne or another CloudFoundry specialist if you want to run databases/services that you don't have first class competency managing.

## About the installer

This project is a combination of the simple command-line chef-based `dev_setup` tool originally released in 2011 and the modern, actively maintained cf-release for BOSH. It is simple to use, does not require BOSH to be installed and running, and yet is continually up-to-date with the latest open source releases from the CloudFoundry core team.

**Help?** Whether you want to start with this CloudFoundry Installer, or with a full BOSH deployment, or migrate from the former to the latter at a future time, you can always request assistance from us at Stark & Wayne or another CloudFoundry consultancy.

### Why not use vcap's dev_setup to install CloudFoundry?

When CloudFoundry was first released in 2011, it came with a script called `dev_setup` and a Chef cookbook to install CloudFoundry. Unfortunately for `dev_setup` users, the Chef cookbooks were not maintained in parallel with the new runtimes and services that CloudFoundry supported.

It is likely that `dev_setup` will be deprecated in future as it is completely distinct from the new description for how to run CloudFoundry - using BOSH.

In April 2012, VMWare released their internal deployment system for deploying [CloudFoundry.com](http://cloudfoundry.com), called BOSH. They also released cf-release, a BOSH release for CloudFoundry. Importantly, these two projects are actively developed by all VMWare staff working on CloudFoundry and represent the leading edge of development of [cloudfoundry.com](http://cloudfoundry.com).

### Why not use BOSH to install CloudFoundry?

BOSH is a stateful, running system. It can manage the entire lifecycle of a deployment including the provisioning & destruction of virtual machines, attached disks, internal DNS, and associations with external networking (pre-provisioned static IP addresses). It is accessed via a CLI or API, and it proactively watches all the jobs of a running deployment (for example, Cloud Foundry) to ensure that the infrastructure is running as expected. It is huge and wonderful and actively developed by half a dozen VMWare engineers.

The initial author of the CloudFoundry Installer, Dr Nic Williams, is a huge fan of BOSH and has given many presentations on it. It was with his knowledge of BOSH and cf-release that he was able to create CloudFoundry Installer without requiring you to have BOSH actually running.

This CloudFoundry Installer does use BOSH without requiring you to have BOSH installed and running. It uses the source code for BOSH and the original (or extended) cf-release to create the same net result - you will have CloudFoundry running on one or more servers within your datacenter or cloud.

## Requirements

**Ruby.** All servers, including your local machine (you can optionally run the installer from a local machine directed at a set of remote servers), must have Ruby installed. It is valid to have ruby `1.8.7` or higher. It is preferable to run ruby `1.9.3` as demonstrated above.

```
$ ruby -v
ruby 1.9.3p327
```

It is a requirement that you use **64-bit operating systems**. Technically this is only a requirement for the servers that run databases, but it is easier for you and me if we don't get specific about which servers those are and we have a blanket rule: only 64-bit servers. I won't accept patches to fix 32-bit issues. 32-bit servers can die. Please improve your applications' memory footprint through other techniques. Thanks for understanding.

**Servers can communicate with each other.** The goal of this installer isn't to get completely fancy. Please ensure that all participating servers can communicate with all other installers on any port.

### Best path

Although the CloudFoundry core developers state that CloudFoundry is only supported for Ubuntu, ideally CloudFoundry can run on any operating system. In fact, this installer does not use any system packages for CloudFoundry. Every package is installed from source or pre-compiled, portable binaries. 

If you are not using Ubuntu, please be prepared to help with debugging and patching of CloudFoundry, BOSH, cf-release and this cloudfoundry-installer. Your help is appreciated to make CloudFoundry available to more people.

## Usage

The are two usage scenarios:

* Run the installer on a server that will itself run CloudFoundry
* Run the installer from a remote machine, such as your personal computer, which will in turn machine the installation against a set of remote servers [recommended]

The latter is the more flexible, supportable method. The former exists because it is how the latter is implemented. That is, the remote installer method uses the local installer installer.

### Local installer

Login to the server or virtual machine that you will run

```
gem install cloudfoundry-installer
cloudfoundry-installer --local
```

### Remote installer [recommended]

The recommended use of the installer is to target one or more servers from a connected remote machine or laptop.

```
gem install cloudfoundry-installer
cloudfoundry-installer --all 1.2.3.4
cloudfoundry-installer --main 1.2.3.4 --dea 1.3.1.1 1.3.1.2 --services 1.4.1.1
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

