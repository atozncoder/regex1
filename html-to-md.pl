#! /usr/bin/perl

while (<>) {
    s/<[Hh]1[^>]*>(.*?)<\/[Hh]1>/# \1\n/;
    s/<[Hh]2[^>]*>(.*?)<\/[Hh]2>/## \1\n/;
    s/<[Hh]3[^>]*>(.*?)<\/[Hh]3>/### \1\n/;
    s/<li>/+ /;
    s/<\/li>//;
    s/<\/?ul>\n//;
    s/<code>(.*?)<\/code>/`\1`/g;
    s/<a href="(.*?)">(.+?)<\/a>/[\2](\1)/g;
    s/<em>(.*?)<\/em>/_\1_/g;
    if (/\+ <p>/) {
        s/<\/?p>//g;
    }
    s/<p>(.+?)<\/p>/\n    \1\n/;

    print;
}