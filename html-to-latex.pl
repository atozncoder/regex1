#! /usr/bin/perl

while(<>) {
    s/<[Hh]1.*>(.+?)<\/[Hh]1>/\\title{\1}\n/;
    s/<[Hh]2.*>(.+?)<\/[Hh]2>/\\section{\1}\n/;
    s/<[Hh]3.*>(.+?)<\/[Hh]3>/\\subsection{\1}\n/;
    # s/<ul>/\\begin{itemize}/;
    s/<\\ul>/\\end{itemize}/;

    print;
}