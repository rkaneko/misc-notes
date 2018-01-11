Jobs to be done (JTBD)
===

# Job stories

- User storyはチームに流動性があり、プロダクトが成熟しているときにはうまくいきやすい。
- スクラッチから作る場合にはUser storyがうまくフィットするかは疑問がある。
  - [Replacing The User Story With The Job Story](https://jtbd.info/replacing-the-user-story-with-the-job-story-af7cdee10c27)
- Job storyはプロダクトデザインプロセスを「コンテキスト」「因果関係」「モチベーション」にフォーカスさせる。インプリメンテーションにはフォーカスしていない。
- User storyはプロダクトデザインプロセスを「仮説」「主観性」「ペルソナ」「実装」にフォーカスさせる。
  - https://jtbd.info/5-tips-for-writing-a-job-story-7c9092911fc9
- User storyの問題点は、多くの仮説をもとにしていて、因果関係を認識していない点。
- User storyのフォーマットは以下の通り。
  -  As a [type of user], I want [some action], so that [outcome]
  - e.g. As a moderator, I want to create a new game by entering a name and an optional description, so that I can start inviting estimators.
  - このフォーマットには**Why**を訪ねる余地がない。
  - コンテキストが抜け落ちていて
- Job storyのフォーマットは以下の通り。
  - When [situation] I want to [motivation] so I can [expected outcome].
  - When I’m ready to have estimators bid on my game, I want to create a game in a format estimators can understand, so that the estimators can find my game and know what they are about to bid on.
- Job storyがうまく書けると次のことにつながりうる
  - チームが議論すべきことにフォーカスするのを助ける(議論の効率化)
  - チームを1つの同じページに置く(共通認識)
- Job storyはゼロベースでイノベーションを起こしたいときにコンセプトとディシジョンメイキングをするときに使う手法と理解。
  - 機能が明確 or デザインが決まっている段階で使用するには遅いのではと[この記事](https://jtbd.info/5-tips-for-writing-a-job-story-7c9092911fc9)を読んで感じる。

## Tips for better job stories

### Refine A Situation By Adding Contextual Information

シチュエーションに、よりコンテキストを加えると、顧客が製品や機能を使うことを遠ざけるあらゆる心配に対応するためのソリューションをデザインするのが容易になる。

### Job Stories Come From Real People Not Personas

ペルソナは仮説や属性をマッシュアップしたものであるため、ペルソナはプロダクトをデザインするためには破壊的な影響をもつ。ペルソナは大雑把な対策や避けるべきことを考えるためには必要。例えば、ある特定の国の国民が製品ターゲットである場合に、緑色は悪いイメージがあるという国民性がある場合は、その色を使わないといった判断をする、といったことがあげられる。
ペルソナという大雑把に分けたものに対して、製品AとBのどちらが好きか、AとBを選ぶ際の判断ポイントなどを訪ねてみても、そのペルソナに対して効果的なソリューションを提供することはおそらく難しい。ペルソナの中にもコンテキストによってモチベーションが変わると思われるため。

Job storyはカスタマーインタビューから作られる。製品を作る前に顧客と話し、コンペティター製品や自分の製品を使う際の心配とそのコンテキストを発見する必要がある。

ペルソナを好んで使う人は、得た情報を整理するためのほかの手法を知らない。

ユーザーインタビューについては知りたければ[こちらのPodcast](http://jobstobedone.org/radio/the-mattress-interview-part-one/)


### Design Modular Job Stories Which Features (Solutions) Can Plug Into

Job storyで重要なことはソリューションに言及しないこと。User storyでは実装方法を定義することを推奨しているので、この点でもJob storyとUser storyは異なる。
Job storyを解決するソリューションは開発チームを信頼して考えてもらい、スプリントバックログアイテムで管理してもらう?

### Add Forces To Motivations

モチベーションに真意を加えることは、シチュエーションにコンテキストを加えることに似ている。
ソリューションはその真意を削減する手助けをするものをデザインすればよい。

e.g.

Motivation: I want to get help right away…
Force: I’m irritated because I was in the middle of something…
Force: I get nervous asking for help…
Solution1:  that customers don’t have to wait long to get help.
Solution2: Remind customers how common it is to ask for help.

### Job Stories Don’t Have To Be From A Specific Point Of View

Job storyは「私」という視点から書かなければいけないものではない。第三者視点から書いてもよい。

# Recap

Better job story is like following

- In 'when part', adding context to situation concretely
  - Understanding its context enables you to design its solution effectively
- Think about concrete customers, not persona
  - Persona is organized laughly, so a solution isn't effective for all customers categorized in a persona
- Job story should not refer its solution.
  - Developer team think how we resolve its problem
- Adding forces to motivations
  - We can design its solution to reduce forces of motivations

#### Reference

- https://jtbd.info/replacing-the-user-story-with-the-job-story-af7cdee10c27
- https://jtbd.info/5-tips-for-writing-a-job-story-7c9092911fc9
- https://blog.intercom.com/using-job-stories-design-features-ui-ux/
