#!/usr/bin/python3.4

import urllib.request

class Domain:
    name      = ""
    updateUrl = ""
    currentIP = ""
    registeredIP = ""

    def __init__(self, name, updateUrl):
        self.name      = name
        self.updateUrl = updateUrl
        self._setCurrentIP()
        self._setRegisteredIP()

    def _setCurrentIP(self):
        data = urllib.request.urlopen("http://ip-api.com/line/?fields=query").read()
        self.currentIP = data.decode("utf-8").strip()

    def _setRegisteredIP(self):
        data = urllib.request.urlopen("http://ip-api.com/line/" + self.name + "?fields=query").read()
        self.registeredIP = data.decode("utf-8").strip()


domains = []
domains.append(Domain("example.com", "https://freedns.afraid.org/dynamic/update.php?SoMeWeIrDHex"))
domains.append(Domain("example2.com", "https://freedns.afraid.org/dynamic/update.php?SoMeWeIrDHex"))

for domain in domains:
    if domain.currentIP != domain.registeredIP:
        urllib.request.urlopen(domain.updateUrl)
        print("Updated IP for " + domain.name + " to " + domain.currentIP)
        print("===========================================\n")
