#! /user/bin/perl

print "\\documentclass{article}\n\\usepackage{hyperref}\n\\begin{document}\n";

while (<>) {
    s/<[Hh]1[^>]*>(.+?)<\/[Hh]1>/\/title{\1}/;
    s/<[Hh]2[^>]*>(.+?)<\/[Hh]2>/\/section{\1}/;
    s/<[Hh]3[^>]*>(.+?)<\/[Hh]3>/\/subsection{\1}/;
    s/<ul>/\\begin{itemize}/;
    s/<\/ul>/\\end{itemize}/;
    s/<li>/\\item /;
    s/<\/li>//;
    s/<code>(.+?)<\/code>/texttt{\1}/;
    s/<a href="(.+?)">(.+?)<\/a>/\\href{\1}{\2}/g;
    s/<em>(.+?)<\/em>/\\textit{\1}/g;
    if (/\\item<p>/) {
        s/<p>//g;
        s/<\/p>//g;
    }
    s/<p>(.+?)<\/p>/\\begin{verbatim}\n\1\n\\end{verbatim}\n/;
    s/\n\n/\n/;


    print;
}