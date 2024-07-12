# Quickstart

## Dependencies

This library requires API key to function. You may sign up for a free API key at <https://www.ip2location.io/pricing>.

## Installation

To install this library using dub:

```
"dependencies": {
    "ip2whois-d": "~master"
}
```

## Sample Codes

### Lookup Domain Information

You can lookup domain information as below:

```d
import std.stdio;
import ip2whois;

int main() {
	auto apiKey = "YOUR_API_KEY";
	auto domain = "locaproxy.com";
	auto whois = new IP2Whois(apiKey);
	
	auto result = whois.lookup(domain);
	
	if ("domain" in result) {
		writefln("domain: %s", result["domain"].str);
		writefln("domain_id: %s", result["domain_id"].str);
		writefln("status: %s", result["status"].str);
		writefln("create_date: %s", result["create_date"].str);
		writefln("update_date: %s", result["update_date"].str);
		writefln("expire_date: %s", result["expire_date"].str);
		writefln("domain_age: %s", result["domain_age"].integer);
		writefln("whois_server: %s", result["whois_server"].str);
		writefln("nameservers: %s", result["nameservers"]);
		
		auto registrar = result["registrar"];
		writefln("registrar => iana_id: %s", registrar["iana_id"].str);
		writefln("registrar => name: %s", registrar["name"].str);
		writefln("registrar => url: %s", registrar["url"].str);
		
		auto registrant = result["registrant"];
		writefln("registrant => name: %s", registrant["name"].str);
		writefln("registrant => organization: %s", registrant["organization"].str);
		writefln("registrant => street_address: %s", registrant["street_address"].str);
		writefln("registrant => city: %s", registrant["city"].str);
		writefln("registrant => region: %s", registrant["region"].str);
		writefln("registrant => zip_code: %s", registrant["zip_code"].str);
		writefln("registrant => country: %s", registrant["country"].str);
		writefln("registrant => phone: %s", registrant["phone"].str);
		writefln("registrant => fax: %s", registrant["fax"].str);
		writefln("registrant => email: %s", registrant["email"].str);
		
		auto admin = result["admin"];
		writefln("admin => name: %s", admin["name"].str);
		writefln("admin => organization: %s", admin["organization"].str);
		writefln("admin => street_address: %s", admin["street_address"].str);
		writefln("admin => city: %s", admin["city"].str);
		writefln("admin => region: %s", admin["region"].str);
		writefln("admin => zip_code: %s", admin["zip_code"].str);
		writefln("admin => country: %s", admin["country"].str);
		writefln("admin => phone: %s", admin["phone"].str);
		writefln("admin => fax: %s", admin["fax"].str);
		writefln("admin => email: %s", admin["email"].str);
		
		auto tech = result["tech"];
		writefln("tech => name: %s", tech["name"].str);
		writefln("tech => organization: %s", tech["organization"].str);
		writefln("tech => street_address: %s", tech["street_address"].str);
		writefln("tech => city: %s", tech["city"].str);
		writefln("tech => region: %s", tech["region"].str);
		writefln("tech => zip_code: %s", tech["zip_code"].str);
		writefln("tech => country: %s", tech["country"].str);
		writefln("tech => phone: %s", tech["phone"].str);
		writefln("tech => fax: %s", tech["fax"].str);
		writefln("tech => email: %s", tech["email"].str);
		
		auto billing = result["billing"];
		writefln("billing => name: %s", billing["name"].str);
		writefln("billing => organization: %s", billing["organization"].str);
		writefln("billing => street_address: %s", billing["street_address"].str);
		writefln("billing => city: %s", billing["city"].str);
		writefln("billing => region: %s", billing["region"].str);
		writefln("billing => zip_code: %s", billing["zip_code"].str);
		writefln("billing => country: %s", billing["country"].str);
		writefln("billing => phone: %s", billing["phone"].str);
		writefln("billing => fax: %s", billing["fax"].str);
		writefln("billing => email: %s", billing["email"].str);
	}
	else if ("error" in result) {
		writefln("Error: %s", result["error"]["error_message"]);
	}
	else {
		writeln("Error: Unknown error.");
	}
	
	return 0;
}
```

### Convert Normal Text to Punycode

You can convert an international domain name to Punycode as below:

```d
import std.stdio;
import ip2whois;

int main() {
	auto whois = new IP2Whois("");
	writefln("Punycode: %s", whois.getPunycode("täst.de"));
	return 0;
}
```

### Convert Punycode to Normal Text

You can convert a Punycode to international domain name as below:

```d
import std.stdio;
import ip2whois;

int main() {
	auto whois = new IP2Whois("");
	writefln("NormalText: %s", whois.getNormalText("xn--tst-qla.de"));
	return 0;
}
```

### Get Domain Name

You can extract the domain name from an url as below:

```d
import std.stdio;
import ip2whois;

int main() {
	auto whois = new IP2Whois("");
	writefln("DomainName: %s", whois.getDomainName("https://www.example.com/exe"));
	return 0;
}
```

### Get Domain Extension

You can extract the domain extension from a domain name or url as below:

```d
import std.stdio;
import ip2whois;

int main() {
	auto whois = new IP2Whois("");
	writefln("DomainExtension: %s", whois.getDomainExtension("example.com"));
	
	return 0;
}
```