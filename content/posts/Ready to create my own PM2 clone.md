---
title: corvusblog
date: 2024-11-30
draft: false
tags:
  - tech
  - tasky
---
Nous y voilà, je ne veux plus utiliser [PM2](https://pm2.keymetrics.io/), j'aimerais avoir la main sur mon propre outil.

J'ai décider de créer le miens du coup.

- **Start, Stop, and Manage Processes**: Control your applications with simple commands.
- **Real-Time Resource Monitoring**: Track CPU and memory usage on the fly.
- **Live Log Viewing**: View real-time logs of your processes.
- **Persistent Process Information**: Logs and process data are saved for later reference.
- **Lightweight & Intuitive**: Simple, fast, and easy-to-use tool for process management.

Voilà une petite idée des besoins pour recréer note propre process manager.

Son petit nom sera Tasky !

---

!![Image Description](https://tashikomaaa.github.io/corvusblog/images/logo.png)

---

Alors du coup la structure du projet va ressembler à ça 

### Strucutre

```
tasky/
├── logs/           # Logs for processes
├── src/            # Source code
│   ├── manager.js  # Process management logic
│   ├── monitor.js  # Monitoring logic
│   └── cli.js      # Command-line interface
├── package.json    # Project dependencies and metadata
└── README.md       # Documentation
```


---

vous pouvez retrouver le projet ici => <a href="https://github.com/tashikomaaa/tasky" target="_blank" >TASKY on github</a>