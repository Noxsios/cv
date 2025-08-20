#import "@preview/splash:0.3.0": tailwind
#set document(title: "Harry Randazzo's CV", author: "Harry Randazzo", keywords: ("software engineer", "razzle", "harry randazzo", "cv", "resume"))
#set page(
  margin: (x: 0.5in, y: 0.5in),
  footer: [
    #set text(8pt)
    #let head = read(".git/HEAD").trim()
    #if head.contains(": ") {
      head = head.split(": ").at(1).trim()
    } else {
      head = head.slice(0, 7)
    }
    #if head == "refs/heads/main" {
      head = read(".git/refs/heads/main").trim().slice(0, 7)
    }
    #let url = "https://github.com/Noxsios/cv/tree/"+head
    `git checkout` #link(url)[#raw(head)]
  ]
)
#set text(
  size: 11pt,
  weight: 300,
  fill: tailwind.slate-950,
  font: "PT Sans",
  fallback: true,
)

#show heading: it => {
  set text(weight: 400)
  smallcaps(it)
}

#let section-heading(header) = {
  rect(
    width: 100%,
    stroke: (left: none, top: none, right: none, bottom: (paint: black, thickness: 1pt, cap: "round")),
    [== #header]
  )
}

#let quad(tl: "tl", tr: "tr", bl: "bl", br: "br") = {
  grid(
    columns: (70%, 30%),
    align(left)[
      #tl \
      #emph(strong(text(tailwind.slate-700, bl))) \
    ],
    align(right)[
      #text(tailwind.slate-700, tr) \
      #emph(text(tailwind.slate-700, br))
    ]
  )
}

#set list(
  marker: ([•], [◦])
)

#grid(
  columns: (1fr, 1fr),
  align(left)[
    #smallcaps(
      text(
        size: 16pt,
        [Harry `"razzle"` Randazzo]
      )
    ) \
    #link("https://razzle.cloud") \
    `$ curl -sL meta.razzle.cloud`
  ],
  align(right)[
    Email : #link("mailto:harry@razzle.cloud") \
    Mobile : +1-213-986-8048
  ]
)

#section-heading[Experience]

#let entry(
  header: quad,
  events: array,
) = {
  header
  v(0.5em)
  list(
    ..events,
    marker: [◦],
  )
}

#show link: underline

#entry(
header: quad(
  tl: [Defense Unicorns],
  tr: [Remote],
  bl: [Software Engineer],
  br: [2022 --- Present],
),
events: (
  [Created #link("https://github.com/defesenseunicorns/maru2")[maru2], a high-performance Go task runner for streamlined workflow automation, combining GitHub Actions–style syntax with remote task distribution via OCI artifacts and robust lifecycle management.],
  [Implemented portions of the Open Containers Initiative (OCI) specification in Go, TypeScript, Rust, and a full client implementation in #link("https://github.com/defenseunicorns/koci")[Kotlin].],
  [Developed core features, refactored legacy code, mentored new developers, rose to engineering technical lead on #link("https://zarf.dev")[Zarf]: a tool to package cloud native applications and deployments, delivering DevSecOps to air gap environments.],
))

#entry(
header: quad(
  tl: [USAF --- Platform One],
  tr: [San Antonio, TX],
  bl: [Software Developer],
  br: [2021 --- 2022],
),
events: (
  [Wrote a Python command-line interface (CLI) for the automation of product releases and release notes generation, greatly expediting the release process on a bi-weekly basis.],
  [Built a #link("https://docs-bigbang.dso.mil")[documentation compiler] for the Big Bang product; assembles the documentation for Big Bang and its packages (20+) into a single, versioned, searchable and clean site.]
))

#entry(
header: quad(
  tl: [USAF --- 1st Combat Communications Squadron],
  tr: [Ramstein AB, Germany],
  bl: [Tactical Computer Networking Technician #sym.arrow.r Software Developer],
  br: [2019 --- 2021],
),
events: (
  [Designed and implemented a web application that combined data from 5+ Air Force systems, producing a simple, searchable, and printable dashboard of an organization's deployment readiness and personnel administrative status.],
  [Core network architect for the team that designed and deployed the DoD's first counter small unmanned aerial system (cSUAS) platform.],
  [Sole network technician for deployed U.S. emergency medical personnel during NATO's largest medical emergency field exercise in its history (2500+ participants, 39 partner nations).],
))

#section-heading[Education]

#quad(
  tl: [University of Maryland Global Campus],
  tr: [Adelphi, MD],
  bl: [Bachelor of Science in Computer Networks & Cybersecurity; GPA: 4.0],
  br: [2020 --- 2023]
)

#quad(
  tl: [Airmen Coders],
  tr: [Remote (Germany \<--\> U.S.A.)],
  bl: [Software Development Immersive Course Graduate],
  br: [May 2020 --- Aug. 2020]
)

#section-heading[Projects]

#link("https://blog.razzle.cloud")[blog.razzle.cloud] - My personal website and blog. Built with Zola, hosted by Vercel.

#link("https://github.com/defenseunicorns/koci")[koci] - Kotlin implementation of the OCI Distribution client specification.

#link("https://dsn-converter.pages.dev")[dsn-converter.pages.dev] - Offline first  web app that allows for conversion of European Defense Switched Network (DSN) phone numbers to their commercial equivalent. Written in React with TypeScript.

#section-heading[Skills]

#let skill = it => {
  box(
    stroke: tailwind.slate-950,
    inset: (x: 0.5em, y: 0.5em),
    radius: 4pt,
    text(
      it
    )
  )
}

#grid(
  columns: 7,
  column-gutter: 0.5em,
  skill[Go],
  skill[OCI/ORAS/Docker],
  skill[JavaScript/TypeScript],
  skill[REST APIs],
  skill[Kubernetes],
  skill[Python],
  skill[CI/CD],
)
