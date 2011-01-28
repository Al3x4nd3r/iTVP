//
//  ITVPXMLReader.m
//  iTVP
//
//  Created by Alexander on 27/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ITVPXMLReader.h"


@implementation ITVPXMLReader

@synthesize nodesList, error;

-(NSMutableArray *) parse: (NSString*) path{
	error = NO;
	NSLog(@"Iniciando parser...");
	//NSURL* url = [NSURL URLWithString:path];
	
	/*NSString *string = [[NSString alloc] initWithContentsOfURL:url
													  encoding:NSUTF8StringEncoding error:nil];

	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	NSLog(@"Result %@", string);
	NSLog(@"Temp 2 %@", data);*/
	//path = @"http://www.xmlfiles.com/examples/note.xml";
	
	NSXMLParser* parser = nil;

	NSURL *url = nil;

//	http://192.168.0.76:8080/mobile/listNodes
	NSRange range = [path rangeOfString:@"local:"];
	if(range.location == 0){
		path = [[NSString alloc] initWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], [path substringFromIndex:6]];

		url = [NSURL fileURLWithPath:path];
	}
	else {
		url = [NSURL URLWithString:path];
	}
	
	NSString* string = [[NSString alloc] initWithContentsOfURL:url
											  encoding:NSUTF8StringEncoding error:nil];
	
	
	//NSLog(@"After %@", string);
//	NSArray *comps = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//	NSString *stringRejoined = [comps componentsJoinedByString:@""];
//	NSLog(@"Before %@", stringRejoined);

	parser = [[NSXMLParser alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];

	[parser setDelegate:self];
	[parser parse];
	[parser release];
	
	
	NSLog(@"Parser Finalizado %d", [nodesList count]);	
	return nodesList;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
	NSLog(@"Iniciando documento");
	nodesList = [[NSMutableArray alloc] initWithCapacity:10];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
	NSLog(@"Finalizando documento");
//	[currentElement release];
//	[tempNode release];
}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{

	NSLog(@"startElement %@", elementName);
	[currentElement release];
	currentElement = [elementName copy];

	
	if([elementName isEqualToString:@"node"]){
		tempNode = [[ITVPNode alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{

	NSLog(@"endElement %@", elementName);

	currentElement = @"lixo";
	
	if([elementName isEqualToString:@"node"]){
		[nodesList addObject:tempNode];
		NSLog(@"NodeListSize %d", [nodesList count]);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	NSLog(@"contentElement |%@|", string);
	NSString *trimmedString = [string stringByTrimmingCharactersInSet:
							   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSLog(@"After |%@|",trimmedString);

	if([currentElement isEqualToString:@"name"]){
		tempNode.name = trimmedString;

	}
	else if([currentElement isEqualToString:@"online"]){
		if([trimmedString isEqualToString:@"true"]){
			tempNode.findable = YES;
		}
		else{
			tempNode.findable = NO;
		}
	}
	else if([currentElement isEqualToString:@"address"]){
		tempNode.address = trimmedString;
		tempNode.description = [[NSString alloc] initWithFormat:@"Servidor sendo executado no IP %@. Qualquer problema entre em contato com <itvp-suporte@dynavideo.com.br>", tempNode.address];
	}
	else if([currentElement isEqualToString:@"lat"]){	
		tempNode.latitude =  [trimmedString doubleValue];
	}
	else if([currentElement isEqualToString:@"lon"]){
		tempNode.longitude = [trimmedString doubleValue];
	}
	
	//[trimmedString release];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError 
{
	

    NSLog(@"Error on parser: %@", [parseError localizedDescription]);
	error = YES;
}

@end
