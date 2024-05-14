#import "@preview/splash:0.3.0": tailwind
#set document(title: "Harry Randazzo's CV", author: "Harry Randazzo", keywords: ("software engineer", "razzle", "harry randazzo", "cv", "resume"))
#set page(
  margin: (x: 0.5in, y: 0.5in),
  footer: [
    #set text(8pt)
    #let head = read(".git/HEAD").trim().split(": ").at(1)
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

#let h2(header) = {
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

#h2[Experience]

#let pe(
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

#pe(
header: quad(
  tl: [Defense Unicorns],
  tr: [Remote],
  bl: [Software Engineer],
  br: [2022 --- Present],
),
events: (
  [Architected and implemented core features, refactored legacy code, mentored new developers, engineering technical lead on #link("https://zarf.dev")[Zarf]: a tool to package cloud native applications and deployments, delivering DevSecOps to air gap environments.],
  [Created company's first AI web app deployed to DoD customers.]
))

#pe(
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

#pe(
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

#h2[Education]

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

#h2[Projects]

#link("https://blog.razzle.cloud")[blog.razzle.cloud] - My personal website and blog. Built with Zola, hosted by Vercel.

#link("https://palx-pwa.pages.dev")[palx-pwa.pages.dev] - Given a base color, generate a palette, then render all the shades, as well as provide download buttons for a variety of formats. Written in Svelte with SvelteKit.

#link("https://dsn-converter.pages.dev")[dsn-converter.pages.dev] - Offline first mobile friendly progressive web app (PWA) that allows for conversion of European Defense Switched Network (DSN) phone numbers to their commercial equivalent. Written in React with TypeScript.

#h2[Skills]

#let skill = it => {
  box(
    // fill: tailwind.slate-950,
    stroke: tailwind.slate-950,
    inset: (x: 0.5em, y: 0.5em),
    radius: 4pt,
    text(
      // fill: tailwind.slate-100,
      it
    )
  )
}

#grid(
  columns: 6,
  column-gutter: 0.5em,
  skill[Go],
  skill[OCI/ORAS/Docker],
  skill[JavaScript/TypeScript],
  skill[Svelte/SvelteKit],
  skill[Kubernetes],
  skill[Python],
)
