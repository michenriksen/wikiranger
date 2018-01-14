# Wikiranger

When an anonymous contribution is made on [Wikipedia], the IP address is recorded as the author of the contribution. This simple tool can
collect information on Wiki contributions across an arbitrary amount of IP CIDR ranges, and display a list of top contributing IP addresses as well as a list of most edited pages. Wikiranger can also write all contribution data to a CSV file for further analysis with other tools.

Wikiranger can be used to determine an organization's gateway IP address, or to get a better understanding of the topics that an organization is concerned about.

## Installation

    $ gem install wikiranger

## Usage

### Example:

Analysing Wiki activity from the Federal Communications Commission (FCC):

```
$ wikiranger --csv /tmp/fcc_contribs.csv 192.104.54.0/24 192.133.125.0/24
       _ _   _
 _ _ _|_| |_|_|___ ___ ___ ___ ___ ___
| | | | | '_| |  _| .'|   | . | -_|  _|
|_____|_|_,_|_|_| |__,|_|_|_  |___|_| v0.1.0
         by @michenriksen |___|

[+] Gathering Wiki contributions for 508 hosts: |===============================================================================================| 100%
[+] Gathered 437 Wiki contributions
[+] Wrote Wiki contribution data to /tmp/fcc_contribs.csv

TOP 10 CONTRIBUTORS:
192.104.54.21: 313 contributions (latest: Tue, 03 Aug 2010 20:55:32 +0000)
192.104.54.79: 49 contributions (latest: Tue, 25 Apr 2017 19:50:05 +0000)
192.104.54.179: 31 contributions (latest: Wed, 13 Sep 2017 17:38:40 +0000)
192.104.54.77: 23 contributions (latest: Thu, 03 Jan 2013 20:11:51 +0000)
192.104.54.166: 11 contributions (latest: Tue, 06 Dec 2011 14:26:39 +0000)
192.104.54.4: 9 contributions (latest: Fri, 10 Sep 2004 18:19:03 +0000)
192.104.54.1: 1 contributions (latest: Wed, 03 Mar 2004 19:59:59 +0000)

TOP 10 MOST EDITED PAGES:
Talk:Star Trek Into Darkness: 461KB (https://en.wikipedia.org/?curid=33786129)
Federal Communications Commission: 284KB (https://en.wikipedia.org/?curid=55974)
Aquarium: 241KB (https://en.wikipedia.org/?curid=19230351)
Henry James: 235KB (https://en.wikipedia.org/?curid=83117)
Hurricane Katrina: 187KB (https://en.wikipedia.org/?curid=2569378)
Edgar Cayce: 185KB (https://en.wikipedia.org/?curid=159184)
World of Warcraft Trading Card Game: 167KB (https://en.wikipedia.org/?curid=4053759)
Charlie Adam: 108KB (https://en.wikipedia.org/?curid=5232021)
Voice over IP: 107KB (https://en.wikipedia.org/?curid=75028)
Photography: 106KB (https://en.wikipedia.org/?curid=23604)
```

The `/tmp/fcc_contribs.csv` file contains complete information of all contributions:

```csv

user,page_id,rev_id,parent_id,title,timestamp,comment,size
192.104.54.1,490292,4204587,2615510,Morgan Bible,2004-03-03T19:59:59Z,"",1944
192.104.54.4,23604,5842054,5787335,Photography,2004-09-10T18:19:03Z,/* History of photography */,18178
192.104.54.4,23604,5787335,5787318,Photography,2004-09-10T18:18:12Z,/* Obtaining Photography */,18169
192.104.54.4,23604,5787318,5787281,Photography,2004-09-10T18:16:16Z,/* Obtaining Photography */,18194
192.104.54.4,23604,5787281,5787047,Photography,2004-09-10T18:04:04Z,/* Obtaining Photography */,18169
192.104.54.4,23604,5787047,5786863,Photography,2004-09-10T17:55:22Z,/* History of photography */,18101
192.104.54.4,23604,5786863,5786846,Photography,2004-09-10T17:54:25Z,/* History of photography */,18096
192.104.54.4,19230351,5201932,4607534,Aquarium,2004-07-13T16:35:26Z,/* External links */,6074
192.104.54.4,19230351,4607534,4607480,Aquarium,2004-07-13T16:33:41Z,/* Aquarium Hobby */,5905
. . .
192.104.54.179,9673623,621253922,532212692,The Review of Litigation,2014-08-14T19:53:44Z,"",3017
192.104.54.179,27974327,612800294,590442127,Mignon Clyburn,2014-06-13T18:54:30Z,"",3625
192.104.54.179,92032,594287736,591586594,"Coos County, Oregon",2014-02-06T23:45:38Z,"The Coquille Indian Tribe still exists, is federally-recognized, and has Coos County designated as part of its Tribal ""service area"" pursuant to the Coquille Restoration Act.",11450
192.104.54.179,17917988,578732844,518057467,Windy Run,2013-10-25T19:41:52Z,/* Pronunciation and Origin of Name */,2288
192.104.54.179,20420662,569459681,569430538,Rickenbacker 4001,2013-08-20T19:09:21Z,"",6258
192.104.54.179,23495051,566849435,566849128,RabbitEars,2013-08-02T12:45:22Z,Fixed the journalist link.,28549
192.104.54.179,23495051,566849128,530941466,RabbitEars,2013-08-02T12:42:43Z,Added new article.,28536
192.104.54.179,3869822,564780654,555162817,WDTV,2013-07-18T12:17:47Z,"",12739
192.104.54.179,5787700,561537025,548727677,Allen & Company,2013-06-25T16:19:57Z,"",5280
192.104.54.179,15516,555105308,555032370,Intelsat,2013-05-14T20:05:36Z,"/* History */ Minior edit, ""of"" -> ""over""",26077
```

See `wikiranger --help` for more options.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michenriksen/wikiranger.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[Wikipedia]: https://www.wikipedia.org/