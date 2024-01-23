#let mixed(body) = {
	show regex("[[:ascii:]]"): set text(font: "Lusitana")
	body
}

#let page_settings(doc) = {
	set page("a4")
	set par(justify: true)

	show par: set block(spacing: 0.65em)	// 段落ごとの間隔
	show list: set block(spacing: 0.8em)
	show figure.where(						// 表のキャプションの位置
		kind: table
	): set figure.caption(position: top)

	show "、": "，"
	show "。": "．"
	show "": h(1em)
	show "󱖢": v(0.2em)
	doc
}

#let title(
	hoge: none,
	title: none,
	authors: (),
	entitle: none,
	enauthors: (),
) = {
	set align(center)

	v(-1em)

	text(font: "IPA Gothic", size: 10pt)[
		#mixed(hoge)	
	]
	
	v(0.5em)

	text(font: "IPA Gothic", size: 15pt)[
		#mixed(title)
	]

	v(-0.3em)

	text(font: "IPA Gothic", size: 12pt, grid(
			columns: (1fr,) * 2,
			row-gutter: 24pt,
			..authors.map(author => [#author.name]),
	))

	v(0.2em)
	
	text(font: "IPA Gothic", size: 15pt)[
		#mixed(entitle)
	]

	v(-0.3em)

	text(font: "IPA Gothic", 12pt, grid(
			columns: (1fr,) * 2,
			row-gutter: 24pt,
			..enauthors.map(enauthor => [#enauthor.name]),
	))

	v(0.3em)
}

#let main_text(doc) = {
	set text(size: 10pt, lang: "ja", font: "IPAmjMincho")
	show regex("[[:ascii:]]"): set text(font: "Lusitana")

	set	enum(numbering: "(1a)", body-indent: 0.3em)
	set list(body-indent: 0.2em)
	set heading(numbering: "1. ")
	show heading: set text(font: "IPA Gothic", size: 10pt)

	set align(left)
	columns(2, doc)
}


#let bib(title: "参考文献", body) = {
	set heading(numbering: none)
	align(center)[= #title]
	pad(top: -2pt, bottom: -5pt, line(length: 100%, stroke: 0.5pt))
	set enum(numbering: "1)")
	set text(font: "IPAmjMincho", size: 7pt, weight: "regular")
	mixed(body)
}


#let code(body) = {
	set raw(tab-size: 4)
	show raw.where(block: true): block.with(
		fill: rgb("f6f8fa"),
		inset: 8pt,
		radius: 8pt,
		width: 100%,
	)
	[#body]
}

#let st(body, t: none) = {
	set text(size: 0.9em)
	pad(y: 0.25em)[
		#figure(
			caption: [#t],
			body
		)
	]
}
