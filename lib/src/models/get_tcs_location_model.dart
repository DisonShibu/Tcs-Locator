// To parse this JSON data, do
//
//     final getTcsLocationModel = getTcsLocationModelFromJson(jsonString);

import 'dart:convert';

GetTcsLocationModel getTcsLocationModelFromJson(String str) => GetTcsLocationModel.fromJson(json.decode(str));

String getTcsLocationModelToJson(GetTcsLocationModel data) => json.encode(data.toJson());

class GetTcsLocationModel {
    final Constants constants;
    final List<Bound> bounds;
    final List<Location> locations;

    GetTcsLocationModel({
        this.constants,
        this.bounds,
        this.locations,
    });

    factory GetTcsLocationModel.fromJson(Map<String, dynamic> json) => GetTcsLocationModel(
        constants: Constants.fromJson(json["constants"]),
        bounds: List<Bound>.from(json["bounds"].map((x) => Bound.fromJson(x))),
        locations:json["locations"] != null ?List<Location>.from( json["locations"].map((x) => Location.fromJson(x))):null,
    );

    Map<String, dynamic> toJson() => {
        "constants": constants.toJson(),
        "bounds": List<dynamic>.from(bounds.map((x) => x.toJson())),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    };
}

class Bound {
    final int breakPoint;
    final int zoom;
    final Bounds bounds;
    final String id;

    Bound({
        this.breakPoint,
        this.zoom,
        this.bounds,
        this.id,
    });

    factory Bound.fromJson(Map<String, dynamic> json) => Bound(
        breakPoint: json["breakPoint"],
        zoom: json["zoom"],
        bounds: Bounds.fromJson(json["bounds"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "breakPoint": breakPoint,
        "zoom": zoom,
        "bounds": bounds.toJson(),
        "id": id,
    };
}

class Bounds {
    final double south;
    final double west;
    final double north;
    final double east;

    Bounds({
        this.south,
        this.west,
        this.north,
        this.east,
    });

    factory Bounds.fromJson(Map<String, dynamic> json) => Bounds(
        south: json["south"].toDouble(),
        west: json["west"].toDouble(),
        north: json["north"].toDouble(),
        east: json["east"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "south": south,
        "west": west,
        "north": north,
        "east": east,
    };
}

class Constants {
    final String getDirection;
    final String findOutMore;
    final String contactUs;
    final String mailUs;
    final String defaultDropdownValue;

    Constants({
        this.getDirection,
        this.findOutMore,
        this.contactUs,
        this.mailUs,
        this.defaultDropdownValue,
    });

    factory Constants.fromJson(Map<String, dynamic> json) => Constants(
        getDirection: json["getDirection"],
        findOutMore: json["findOutMore"],
        contactUs: json["contactUs"],
        mailUs: json["mailUs"],
        defaultDropdownValue: json["defaultDropdownValue"],
    );

    Map<String, dynamic> toJson() => {
        "getDirection": getDirection,
        "findOutMore": findOutMore,
        "contactUs": contactUs,
        "mailUs": mailUs,
        "defaultDropdownValue": defaultDropdownValue,
    };
}

class Location {
    final String area;
    final String geo;
    final String location;
    final List<String> officeType;
    final List<dynamic> additionalInfo;
    final String address;
    final String phone;
    final Geometry geometry;
    final String email;
    final List<dynamic> keywords;
    final List<Website> websites;
    final String id;
    final String fax;

    Location({
        this.area,
        this.geo,
        this.location,
        this.officeType,
        this.additionalInfo,
        this.address,
        this.phone,
        this.geometry,
        this.email,
        this.keywords,
        this.websites,
        this.id,
        this.fax,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        area:json["area"]!=null? json["area"]:null,
        geo:json["geo"]!=null? json["geo"]:null
      ,
        location:json["location"]!=null? json["location"]:null,
        officeType:json ["officetype"]!=null? List<String>.from(json["officeType"].map((x) => x)):null,
        additionalInfo:json["additionalInfo"]!=null? List<dynamic>.from(json["additionalInfo"].map((x) => x)):null,
        address: json["address"]!=null?json["address"]:null,
        phone: json["phone"]!=null?json["phone"]:null,
        geometry:json["geometry"]!=null? Geometry.fromJson(json["geometry"]):null,
        email: json["email"]!=null? json["email"]:null,
        keywords:json["keywords"]!=null? List<dynamic>.from(json["keywords"].map((x) => x)):null,
        websites:json["websites"]!=null? List<Website>.from(json["websites"].map((x) => Website.fromJson(x))):null,
        id: json["id"]!=null?json["id"]:null,
        fax: json["fax"]!=null?json["fax"]:null,
    );

    Map<String, dynamic> toJson() => {
        "area": area,
        "geo": geo,
        "location": location,
        "officeType": List<dynamic>.from(officeType.map((x) => x)),
        "additionalInfo": List<dynamic>.from(additionalInfo.map((x) => x)),
        "address": address,
        "phone": phone,
        "geometry": geometry.toJson(),
        "email": email,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "websites": List<dynamic>.from(websites.map((x) => x.toJson())),
        "id": id,
        "fax": fax,
    };
}

class Geometry {
    final double lat;
    final double lng;

    Geometry({
        this.lat,
        this.lng,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Website {
    final String name;
    final String url;

    Website({
        this.name,
        this.url,
    });

    factory Website.fromJson(Map<String, dynamic> json) => Website(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
