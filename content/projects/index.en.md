---
title: "Projects"
ShowToc: true
TocOpen: true
draft: false
---

Here you will find my Open Source projects.

## \#Kremen.Transport

Map of public transport in Kremenchuk City, Ukraine.

- **GitHub:** [Web](https://github.com/husky-dev/kremen-transport-web), [Mobile](https://github.com/husky-dev/kremen-transport-mobile), [API](https://github.com/husky-dev/kremen-api)
- **Apps:** [Web](https://transport.kremen.dev), [App Store](https://apps.apple.com/ua/app/kremenchuk-public-transport/id1600469756), [Google Play](https://play.google.com/store/apps/details?id=com.krementransport)

An application for tracking buses, trolleybuses, and minibuses in Kremenchuk, Ukraine is available. You can use it to find out the arrival time of the transport at the bus stop and view only the required routes on the map.

![kremen-transport-web.jpeg](assets/kremen-transport-web-1148.jpg)

The project started as a pet-project that I used to test new technologies, libraries, and architectural solutions. Over time, it gained a user base and began to be used on the official website of the [Kremenchuk City Council](https://kremen.gov.ua/).

As practice has shown, the main use case arises when a user arrives at a bus stop and wants to know how long they will have to wait for the desired transport to arrive. To make this case as efficient as possible, I have optimized both the interface and the API. Upon launching the app, it immediately displays the user's current location, nearest stops, and available buses. The app then sends requests to the API, fetching the current positions of transport only for the routes selected by the user, resulting in a minimal data package sent by the back-end. Subsequently, a connection is established with the back-end using web sockets, enabling the user to receive real-time data from the server.

![kremen-transport-mobile.png](assets/kremen-transport-mobile-0e80.png)

At the back-end, Redis is utilized for caching and Pub/Sub tasks, while transport movement logs are stored in MongoDB.

![kremen-transport-architecture.png](assets/kremen-transport-architecture-94b9.png)

All user data and settings are stored locally, either in a browser or on a smartphone. The platform does not collect data specific to any individual. It only collects analytics related to the use of its features, without any reference to the individual user.

Technologies used:

- **Web:** React, TypeScript, ESBuild.
- **Mobile:** React Native, TypeScript.
- **API:** NodeJS, TypeScript, Docker, Docker Compose, Redis, MongoDB.

## \#Kremen.Equipment

Map of municipal vehicles: snowplows, sprinklers, and tractors in Kremenchuk City, Ukraine.

- **GitHub:** [Web](https://github.com/husky-dev/kremen-equipment-web), [API](https://github.com/husky-dev/kremen-api)
- **Apps:** [Web](https://equipment.kremen.dev)

The idea for this project came up in the winter when I wanted to find out which areas are effectively cleaned of snow and which are not. The [Kremenchuk City Council website](https://kremen.gov.ua/) has a map of the movement of municipal equipment, but it doesn't allow you to view the history. Additionally, it would be nice to see a heat map of the equipment's work so you can visually see how your neighborhood was cleaned throughout the day. That's how this app came about.

![kremen-equipment-web.jpeg](assets/kremen-equipment-web-23f4.jpg)

It uses the same technology stack as [\#Kremen.Transport](#krementransport): MongoDB for logging movements and Redis for caching data.

- **Web:** React, TypeScript, ESBuild.
- **Mobile:** React Native, TypeScript.
- **API:** NodeJS, TypeScript, Docker, Docker Compose, Redis, MongoDB.

## md2snipp - Markdown to VSCode snippets CLI tool

A tool for generating VSCode snippets from Markdown files.

- **GitHub:** [md2snipp](https://github.com/husky-dev/md2snipp)

Snippets are cool! They help save programmers time and effort. VSCode is also cool. However, it can be challenging to store, manage, and edit multiline snippets. While the JSON format is easy to use, reviewing and editing snippets with a lot of lines can become tedious. Dealing with JSON arrays, indents, and commas may discourage you from editing snippets. Moreover, over time, you may forget some snippets and have to review the JSON file to recall them. To address these issues, I propose storing snippets in a readable Markdown format and converting them to JSON.

![md2snipp-banner.png](assets/md2snipp-banner-a671.png)

Installation:

```other
npm isntall -g md2snipp
```

Usage. Create a folder with `.md` files and with the next format:

![md2snipp-example.png](assets/md2snipp-example-cb14.png)

I usually use `.vscode/snippets` folder for it. Then run next command:

```other
npx md2snipp --root .vscode/snippets --output .vscode
```

The tool will look for a `.md` files at `.vscode/snippets`, will convert it to `.code-snippets` files, and will output a result to `.vscode`. It distinguishes separate snippets by the `**Prefix**` keyword and by and of the code block. You can add any other text and comments. The tool will look only for the keywords and snippet's body.

## chlog-cli - Changelog generator CLI tool

CLI tool for managing `CHANGELOG.md` file based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

- **GitHub**: [chlog-cli](https://github.com/husky-dev/chlog-cli)

Installation:

```other
npm isntall -g chlog-cli
```

Or use with `npx`:

```other
npx chlog-cli help
```

Usage. Init a new changelog:

```other
chlog-cli init
```

Get full changelog:

```other
chlog-cli get
```

Get all changes at `1.50.x` versions:

```other
chlog get 1.50
```

Add record:

```other
chlog add -a 1.50.1 "Some new feature"
```
