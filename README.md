# Windows版Rubyで「𠮷.txt」というファイル名の存在がうまく検知できなかったり、表示できない件

- （おそらくだが）Ruby 3 以前だと、ファイルシステム取得の際に Unicode系 API が使われていない
- Windows10 までのコマンドプロンプトだと、サロゲートペアでないと表現できない Unicode は表示できない

つまり、Ruby 3 以降を、WindowsTerminal で走らせれば大丈夫。

```main.rb
require 'pathname'

dir = Pathname.new(".")

dir.children.each do |cld|
  puts "#{cld} : #{cld.file?}"
end
```

![image](./success.png)

コマンドプロンプトだと、こんな感じになるみたいです（[スレッド]より勝手に引用させていただきました）

![image](./failure.png)

[スレッド]: https://mstdn.jp/@acid_rain@amefur.asia/110343374842403892

