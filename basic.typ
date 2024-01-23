#let basic(doc, font_fam, font_size) = {
	set page(
		"a4",
	)
	set align(left)
	set par(justify: true)

	// フォント設定
	set text(font: font_fam, size: font_size, lang: "ja")
	show emph: set text(font: "IPAmjMincho Italic")
	show strong: set text(font: "IPA Gothic")
	show heading: set text(font: "IPA Gothic")

	set	enum(numbering: "(1a)", indent: 1em)				// 番号リスト文の書式
	set list(indent: 2em, body-indent: 0.3em)					// リスト文でどの程度インデント下げするか
	show par: set block(spacing: 0.65em)	// 段落ごとの間隔
	show list: set block(spacing: 0.8em)
	show figure.where(						// 表のキャプションの位置
		kind: table
	): set figure.caption(position: top)
	show figure.caption: set text(size: 9pt, font: "PlemolJP Console NF", weight: "medium")

	show "、": "，"
	show "。": "．"
	show "": h(1em)
	show "󱖢": v(0.2em)
	doc
}


#let bib(title: "参考文献", body) = {
	align(center)[= #title]
	pad(top: -3pt, bottom: -5pt, line(length: 100%, stroke: 0.5pt))
	set enum(numbering: "1)")
	set text(size: 7pt)
	[#body]
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


/*
	0: 灰(例)
	1: 黄(定義)
	2: 赤(定理)
	3: 水(用語)
	4: 紫(性質)
	5: 緑(証明)
*/
#let blk(title: none, kind: 0, body) = {
	let title-text = {
		text(size: 10.5pt, font: "PlemolJP Console NF Text")[#title]
	}

	let title_bg = ("#b6b6b6", "#fb0", "#f99", "#0df", "#c9f", "#0ea")
	let title_bg = title_bg.at(kind)

	set align(center)
	v(0.3em)
	box(stroke: 1pt + rgb(title_bg), inset: (bottom: 5pt), width: 90%, fill: color.mix((rgb(title_bg), 10%), (white, 90%)))[
		#set align(left)
		#rect(fill: rgb(title_bg), inset: (left: 4pt), [#title-text])
		#rect(stroke: 0pt, inset: (top: 2pt, left: 1em, right: 1em), width: 100%, [#body])
	]
	v(0.3em)
}

#let q(num: none, body) = {
	let title-text = {
		text(size: 10.5pt, font: "PlemolJP Console NF", weight: "medium", fill: white)[問#num]
	}

	let title_bg = "#000"

	set align(center)
	v(1em)
	box(stroke: 1pt + black, inset: (bottom: 5pt), width: 90%, fill: color.mix((black, 5%), (white, 95%)))[
		#set align(left)
		#rect(fill: black, inset: (left: 4pt), [#title-text])
		#rect(stroke: 0pt, inset: (top: 2pt, left: 1em, right: 1em), width: 100%, [#body])
	]
	v(0.5em)
}

#let headerBy(doc, body) = {
	set page(
		header: align(right)[
			#text(size: 8pt)[#body]
		],
		numbering: "1",
	)
	doc
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

#let dotline() = {
	v(1em)
	align(center)[
		#line(length: 90%, stroke: (paint: rgb("#00000070"), thickness: 0.5pt, dash: "dashed"))
	]
}

#let numbered(body) = {
	set math.equation(numbering: "(1)", supplement: [式])
	body
}
